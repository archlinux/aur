# Maintainer: Sosthène Guédon <sosthene.gued@gmail.com>
pkgname=peertube-viewer
pkgver=0.6.2
pkgrel=1
pkgdesc="Peertube command line viewer inspired by youtube-viewer"
arch=('x86_64')
url="https://gitlab.com/SostheneGuedon/peertube-viewer" 
md5sums=('53956157ae475a0d3ae62145e90e63c4')
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
