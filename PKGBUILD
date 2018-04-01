# Maintainer: E5ten

pkgname=yadshot
pkgver=0.1.92
pkgrel=1
pkgdesc="yadshot provides a GUI frontend for taking screenshots using imagemagick/slop and uploads files and pastes to teknik.io "
arch=('x86_64')
url='http://www.simonizor.net'
license=('GPL')
depends=('slop' 'imagemagick' 'yad' 'xclip' 'curl')
source=("https://github.com/simoniz0r/$pkgname/releases/download/$pkgver/$pkgname-$pkgver-$CARCH.tar.gz")
md5sums=('acd0d584dda7a9caeaf1d10e6a4abd78')

prepare() {
    cd $srcdir
    bsdtar xvf $pkgname-$pkgver-$CARCH.tar.gz
}

package() {
	mkdir -p $pkgdir/opt/$pkgname
	mkdir -p $pkgdir/usr/bin
	cp -r "$srcdir/$pkgname/" "$pkgdir/opt/"
   	ln -s "/opt/$pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
