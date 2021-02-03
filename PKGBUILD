pkgname=smartied
pkgver=0.1
pkgrel=2
arch=('x86_64')
url="https://cgit.ctu.cx/gallery/"
license=( 'GPL-3' )
depends=( 'glibc' )
makedepends=( 'nim' 'nimble' 'git' )
_commit="b8e7923f78be9180206e45b59faff2d7d0f8329c"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('76667170e1392a74d0578e6628e61dd6ffa389a5250fb4db8ed8a896c3d184eb')

build() {
  cd "$srcdir/${pkgname}-${_commit}/"
  nimble build -d:release -y
}

package() {
  cd "$srcdir/${pkgname}-${_commit}"
  install -Dm755 ./smartied "$pkgdir"/usr/bin/smartied
}
