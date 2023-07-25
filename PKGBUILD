# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=govarnam-ibus
_pkgname=varnam-ibus-engine
pkgname=${_base}-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="IBus engine for GoVarnam providing Indian language input method"
arch=('x86_64')
url="https://www.varnamproject.com"
license=('AGPL3')
makedepends=('unzip')
depends=('govarnam' 'ibus')
provides=('govarnam-ibus')
source=("https://github.com/varnamproject/${_base}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch}.zip")
sha256sums=('aceeb0b649f25267db91164a4c216d9a71b7cca15083e777a3770cb94356ab32')

package() {
	cd "${_pkgname}"-"${pkgver}"-"${arch}"

	install -Dm 755 varnam-ibus-engine "${pkgdir}/usr/bin/varnam-ibus-engine"

	mkdir -p "${pkgdir}/usr/share/varnam/ibus/icons"
	cp -a --no-preserve=ownership icons/*.png "${pkgdir}/usr/share/varnam/ibus/icons/"


	mkdir -p "${pkgdir}/usr/share/ibus/component"
	cp -a --no-preserve=ownership component/*.xml "${pkgdir}/usr/share/ibus/component"
}
