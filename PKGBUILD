# Maintainer: Sosthène Guédon <sosthene.gued@gmail.com>
pkgname=peertube-viewer
pkgver=0.6.4
pkgrel=1
pkgdesc="Peertube command line viewer inspired by youtube-viewer"
arch=('x86_64')
url="https://gitlab.com/SostheneGuedon/peertube-viewer" 
license=('GPL')
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
md5sums=('7f528716707d2ec1ae373733b816f40a')

build() {
  cd $pkgname-v$pkgver
  make 
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir"  install
}
