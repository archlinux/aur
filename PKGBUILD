# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Brandon Hall <brandonjhall@windstream.net>
pkgname=aurbrowser
pkgver=v1.0.0
pkgrel=1
pkgdesc="A Qt application that allows an Arch Linux user to browse the AUR."
arch=('x86_64')
url="https://gitlab.com/brandonjhall/aurbrowser"
license=('GPL')
depends=('qtermwidget>=0.8.0-1' 'qt5-base>=5.10.0-1' 'gcc-libs>=7.2.1+20180116-1' 'glibc>=2.26-11')
makedepends=('qt5-base')
source=($pkgname-$pkgver.tar.gz::"https://gitlab.com/brandonjhall/aurbrowser/repository/v1.0.0/archive.tar.gz")
md5sums=('371fba9d8712eac4ac571b66819ffa28')

prepare() {
        cd "$pkgname-$pkgver-80b14852309ac58bd1014a811b4f8ff789916fb1"
        qmake "INSTALL_PREFIX=$pkgdir/usr"
}

build() {
	cd "$pkgname-$pkgver-80b14852309ac58bd1014a811b4f8ff789916fb1"
	make
}

check() {
	cd "$pkgname-$pkgver-80b14852309ac58bd1014a811b4f8ff789916fb1"
	make -k check
}

package() {
	cd "$pkgname-$pkgver-80b14852309ac58bd1014a811b4f8ff789916fb1"
	make DESTDIR="$pkgdir/usr/bin" install
}
