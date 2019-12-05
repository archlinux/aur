# Maintainer: Sosthène Guédon <sosthene.gued@gmail.com>
pkgname=peertube-viewer
pkgver=0.6
pkgrel=1
pkgdesc="Peertube command line viewer inspired by youtube-viewer"
arch=('x86_64')
url="https://gitlab.com/SostheneGuedon/peertube-viewer" license=('GPL')
md5sums=('e0c48b96a9d0c346cc30862047d2aa45')
depends=(
  'curl'
  'boost-libs'
)
makedepends=(
  'make'
  'rapidjson'
  'boost'
)

source=("https://gitlab.com/SostheneGuedon/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")

build() {
  cd $pkgname-v$pkgver
  make 
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir"  install
}
