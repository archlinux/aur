# Maintainer: Kyle Bloss <kylebloss[at]pelpix[dot]info>

pkgname=mp4fpsmod
pkgver=0.26
pkgrel=1
pkgdesc="Simple CLI MP4 time code editor"
arch=('any')
license=('custom')
source=("https://github.com/nu774/${pkgname}/archive/v${pkgver}.tar.gz")
url="https://sites.google.com/site/qaacpage/junk"
provides=('mp4fpsmod')
conflicts=('mp4fpsmod-git')
makedepends=('automake')
md5sums=('6b5add8c3d170ca706aa8e0f628e7786')

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
