# Maintainer: E5ten

pkgname=yadshot
pkgver=0.2.01
pkgrel=1
pkgdesc="yadshot provides a GUI frontend for taking screenshots using imagemagick/slop and uploads files and pastes to teknik.io "
arch=('x86_64')
url='http://www.simonizor.net'
license=('GPL')
depends=('slop' 'yad' 'xclip' 'curl')
optdepends=('ffmpeg: screenshot backend'
			'imagemagick: screenshot backend')
source=("https://github.com/simoniz0r/$pkgname/archive/$pkgver.tar.gz")
md5sums=('SKIP')

prepare() {
    cd $srcdir
    bsdtar xvf $pkgver.tar.gz
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
	echo "$(tput setaf 2)This package requires ffmpeg or imagemagick as a screenshot backend, please install something providing one or the other.$(tput sgr0)"
}
