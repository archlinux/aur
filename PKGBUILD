#Maintainer: Steffen Weber <-boenki-gmx-de->
#Contributor: xavi <xavi@netsons.org>

pkgname=xsw
pkgver=0.3.5
pkgrel=3
pkgdesc="Slideshow presentation tool for those who are frustrated with PowerPoint and its clones"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://code.google.com/p/xsw/"
depends=('sdl_ttf' 'sdl_image' 'sdl_gfx')
optdepends=('imagemagick: convert slideshow to png,jpeg,pdf')
source=("http://xsw.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('916849d541a39aa8c96b89a94d523a0b')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make prefix="$pkgdir/usr/" install
}