# Maintainer: Kyle Bloss <kylebloss[at]pelpix[dot]info>

pkgname=mp4fpsmod
pkgver=0.28
pkgrel=1
pkgdesc="Simple CLI MP4 time code editor"
arch=('any')
license=('custom')
source=("https://github.com/nu774/${pkgname}/archive/v${pkgver}.tar.gz")
url="https://github.com/nu774/mp4fpsmod"
provides=('mp4fpsmod')
conflicts=('mp4fpsmod-git')
makedepends=('automake')
md5sums=('b1a19995e329721f0c27b72018f7a369')

#prepare() {
#  cd "$srcdir/$pkgname"
#  ./bootstrap.sh
#}

build() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  ./bootstrap.sh
  ./configure --prefix=/usr
  make

  strip mp4fpsmod
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  make DESTDIR="${pkgdir}" install
}
