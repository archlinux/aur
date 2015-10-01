# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=qccrypt
pkgver=0.6.0
pkgrel=2
pkgdesc='A cross-plateform frontend for ccrypt software'
arch=('i686' 'x86_64')
url="http://qccrypt.free.fr/"
license=('GPL2')
depends=('ccrypt' 'libxcb' 'qt5-base')
source=("http://qccrypt.free.fr/download/qccrypt-${pkgver}-src.zip")

build() {
	cd "${srcdir}/qccrypt-${pkgver}-src"
	qmake-qt5
	make
}

package() {
	cd "${srcdir}/qccrypt-${pkgver}-src"
	install -Dm755 qccrypt "${pkgdir}/usr/bin/${pkgname}"
}

md5sums=('332e2d1db5f1988819fd8942d03b5a4e')
