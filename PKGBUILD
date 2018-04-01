# Maintainer: E5ten

pkgname=rosa-image-writer
_pkgname=RosaImageWriter
_os=lin
pkgver=2.6.2
pkgrel=2
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('x86_64')
url='http://wiki.rosalab.ru/en/index.php/Main_Page'
license=('GPL')
depends=('fontconfig' 'libxcb')
optdepends=('xdg-su: NEEDED by non-KDE users!'
	    'kdebase-runtime: provides kdesu')
source=("http://wiki.rosalab.ru/en/images/7/7f/$_pkgname-$pkgver-$_os-$CARCH.tar.xz")
md5sums=('b7cd2de346410ad10d7996b9c86a7d9d')

prepare() {
    cd $srcdir
    bsdtar xvf $_pkgname-$pkgver-$_os-$CARCH.tar.xz
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
