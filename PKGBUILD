# Maintainer: E5ten

pkgname=yadshot
pkgver=0.1.9
pkgrel=1
pkgdesc="yadshot provides a GUI frontend for taking screenshots using imagemagick/slop and uploads files and pastes to teknik.io "
arch=('x86_64')
url='http://www.simonizor.net'
license=('GPL')
depends=('slop' 'imagemagick' 'yad' 'xclip' 'curl')
source=("https://github.com/simoniz0r/$pkgname/releases/download/$pkgver/$pkgname-$pkgver-$CARCH.tar.gz")
md5sums=('1cfa7da3c2bd1268084c5f39d99ee004')

prepare() {
    cd $srcdir
    tar xvf $pkgname-$pkgver-$CARCH.tar.gz
}

package() {
	mkdir -p $pkgdir/opt/$pkgname
	mkdir -p $pkgdir/usr/bin
	cp "$srcdir/$pkgname/$pkgname.sh" "$pkgdir/opt/$pkgname/$pkgname.sh"
   	cp "$srcdir/$pkgname/teknik.sh" "$pkgdir/opt/$pkgname/teknik.sh"
    sudo ln -s /opt/$pkgname/yadshot.sh /usr/bin/yadshot
}
