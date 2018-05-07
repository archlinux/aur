# Maintainer: E5ten

pkgname=opendm
_pkgname=OpenDM
pkgver=0.0.31
pkgrel=1
pkgdesc="A simple GUI Display Manager written entirely in bash that uses xinit to start X sessions"
arch=('x86_64')
url='http://www.simonizor.net'
license=('MIT')
depends=('qarma' 'xorg-xinit')
install=opendm.install
source=("https://github.com/simoniz0r/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('f1ee41f1a5e2261f667721321249dd63')

prepare() {
    cd $srcdir
    bsdtar xvf v$pkgver.tar.gz
}

package() {
	cd $srcdir/$_pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}
