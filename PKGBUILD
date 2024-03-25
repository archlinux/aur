# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=govarnam-ibus
_pkgname=varnam-ibus-engine
pkgname=${_base}-bin
pkgver=1.6.3
pkgrel=1
pkgdesc="IBus engine for GoVarnam providing Indian language input method"
arch=('x86_64')
url="https://www.varnamproject.com"
license=('AGPL3')
makedepends=('unzip')
depends=('govarnam' 'ibus')
provides=('govarnam-ibus')
source=("https://github.com/varnamproject/${_base}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch}.zip")
sha256sums=('228763d4a5fea4067932fa4e1998178bb28f265d753146e91bbef2f117d8a3f3')

package() {
	cd "${_pkgname}"-"${pkgver}"-"${arch}"

	install -Dm 755 varnam-ibus-engine "${pkgdir}/usr/bin/varnam-ibus-engine"

	mkdir -p "${pkgdir}/usr/share/varnam/ibus/icons"
	cp -a --no-preserve=ownership icons/*.png "${pkgdir}/usr/share/varnam/ibus/icons/"


	mkdir -p "${pkgdir}/usr/share/ibus/component"
	cp -a --no-preserve=ownership component/*.xml "${pkgdir}/usr/share/ibus/component"
}
