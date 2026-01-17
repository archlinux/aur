# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=uroybd
_pkgname=DotR
pkgname=${_pkgname,,}-bin
pkgdesc="A dotfiles manager that is as dear as a daughter"

pkgver=1.0.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname,,}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname,,}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname,,}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname,,}-${_barch[1]}.tar.gz")
sha256sums=('8cd2c6449c4828698f46c481acab9f8e90e182c7a019946bf4e817e140b19799'
            '069a76c6c8506e42015b43755754fff963154fa40bc71afb8716d3e345f292cf')
sha256sums_x86_64=('befd567374bb6500d6ed8fdc15199789885e08d33ad22bcd552ae3f33b62697f')
sha256sums_aarch64=('b2929352fa87f78db1fd93fb60d40ff9a91990d78f667979350633adf8fbb1f8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
