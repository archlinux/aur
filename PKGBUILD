# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Jared Meeker <jared[at]meekers[dot]org>
# Contributor: Dimitris Kiziridis <ragouel[at]outlook[dot]com>

pkgname=dnote-cli-bin
_pkgname="${pkgname%-bin}"
_shortname="${_pkgname%-cli}"
pkgver=0.15.1
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
sha256sums_x86_64=('b2c3de9f1210604f5ba99f0d1489eeeb50e0ff47d43a7740106cd3c659e9bd1e')
sha256sums_aarch64=('4f49fcd626aceb1b565164725d1fbc28200c3cbb83a7b4d11823112ff6d19eef')

package() {
	install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${_shortname}/README.md"
}
