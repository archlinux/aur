pkgname=smartied
pkgver=0.1
pkgrel=4
arch=('x86_64')
url="https://cgit.ctu.cx/smartied/"
license=( 'GPL-3' )
depends=( 'glibc' )
makedepends=( 'nim' 'nimble' 'git' )
_commit="07e96a64e31a91f8b15b3748c987b32b4572f1ee"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('2073820d3746cdaf3c0463597f7ec3d07f677a40338297a4347d2f73f360c498')

build() {
  cd "$srcdir/${pkgname}-${_commit}/"
  nimble build -d:release -y
}

package() {
  cd "$srcdir/${pkgname}-${_commit}"
  install -Dm755 ./smartied "$pkgdir"/usr/bin/smartied
  install -Dm755 ./smartied.service "$pkgdir"/usr//usr/lib/systemd/system/smartied.service
}
