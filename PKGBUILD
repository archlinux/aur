# Maintainer: Aztorius <william.bonnaventure at gmail dot com>
# Maintainer: ZeroDot1 <zerodot1 at bk dot ru>
pkgname=magicfountain
pkgver=1.0.0
pkgrel=2
pkgdesc="A Fountain syntax editor and viewer."
arch=('i686' 'x86_64')
url="https://github.com/Aztorius/magicfountain"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme' 'qt5-webengine')
optdepends=('qt5-translations')

source=("https://github.com/Aztorius/magicfountain/archive/${pkgver}.tar.gz")
md5sums=('c7c61053fe9b91abd2a2611572c4055f')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	qmake PREFIX='/usr' LIBDIR='/usr/lib' magicfountain.pro
        make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make INSTALL_ROOT="$pkgdir/" install
}
