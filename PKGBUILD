# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Jared Meeker <jared[at]meekers[dot]org>
# Contributor: Dimitris Kiziridis <ragouel[at]outlook[dot]com>

pkgname=dnote-cli-bin
_pkgname="${pkgname%-bin}"
_shortname="${_pkgname%-cli}"
pkgver=0.15.2
pkgrel=1
pkgdesc="A simple command line notebook for programmers"
arch=('x86_64' 'aarch64')
url="https://www.getdnote.com/"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source_x86_64=("https://github.com/${_shortname}/${_shortname}/releases/download/cli-v${pkgver}/${_shortname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_shortname}/${_shortname}/releases/download/cli-v${pkgver}/${_shortname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e143caa41cf3024d84a4ecd6c81752f05586cf9516b041d233c507e2ac04d3d3')
sha256sums_aarch64=('127022f96d48b1c586322998672d365a019b2ab50d5f6ed4e10c5e18732c9c54')

package() {
	install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${_shortname}/README.md"
}
