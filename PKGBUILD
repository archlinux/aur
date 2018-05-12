# Maintainer: E5ten

pkgname=yadshot
pkgver=0.2.02
pkgrel=1
pkgdesc="yadshot provides a GUI frontend for taking screenshots using imagemagick/slop and uploads files and pastes to teknik.io "
arch=('x86_64')
url='http://www.simonizor.net'
license=('GPL')
install=yadshot.install
depends=('slop' 'yad' 'xclip' 'curl' 'grabc')
optdepends=('ffmpeg: screenshot backend'
			'imagemagick: screenshot backend')
source=("https://github.com/simoniz0r/$pkgname/archive/$pkgver.tar.gz")
md5sums=('de3d52a5dc9695bb652ad5492c54e836')

prepare() {
    cd $srcdir
    bsdtar xvf $pkgver.tar.gz
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}
