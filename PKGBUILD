# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=xPMo
_pkgname=dtach
pkgname=${_pkgname}-ng-bin
pkgver=0.10
pkgrel=1
pkgdesc="A simple program that emulates the detach feature of screen"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL')

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-ng")

source=("LICENSE-${pkgver}::${_urlraw}/COPYING"
        "README-${pkgver}.md::${_urlraw}/README")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgver}.zip")
sha256sums=('8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            '4c88d62fe38b0445b7c804d05309d886d8b3bb3dd8ab07d6fc62b0eda0cd5eed')
sha256sums_x86_64=('184b26673cd2c0d81b6bb300e920d9e9082e31886838b99e4a3f3a677a1ccccc')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "./bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "./share/man/man1/${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
