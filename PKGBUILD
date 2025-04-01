# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sweetbbak
_pkgname=toru
pkgname=${_pkgname}-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Bittorrent streaming CLI tool for animes"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${arch[0]}.tar.gz")
sha256sums_x86_64=('b748bc40aeeecbc33025f89b4bbb91e246ca5bf8ceb98f9c74257cc485329ccb')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
