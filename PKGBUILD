# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: lspci <agm2819[[aaaa]][[tttt]]gmail[[dd]][[oo]][[tt]][[cc]][[oo]][[mm]]>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=wmbatteries
pkgver=0.1.7
pkgrel=1
pkgdesc="a dockapp based on wmacpiload"
url="http://sourceforge.net/projects/$pkgname/"
depends=('libxpm' 'libxext')
license=('GPL')
arch=('i686' 'x86_64')
options+=('!debug')
source=("https://github.com/tarjanm-movidius/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('d46dc0c6ff031b72ccb1f1ed9a8d3c54')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

