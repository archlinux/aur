# Maintainer: Sosthène Guédon <sosthene.gued@gmail.com>
pkgname=peertube-viewer
pkgver=0.4
pkgrel=1
pkgdesc="Peertube command line viewer inspired by youtube-viewer"
arch=('x86_64')
url="https://gitlab.com/SostheneGuedon/peertube-viewer"
md5sums=('8d17ce6b69c03bf55c48a3dc5f1a1c28')
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

build() {
  cd $pkgname-v$pkgver
  make 
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir"  install
}
