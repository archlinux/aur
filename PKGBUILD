# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>

pkgname=curlie
pkgver=1.2.0
pkgrel=2
pkgdesc='A frontend to curl that adds the ease of use of httpie'
arch=('x86_64')
url="https://curlie.io/"
license=('MIT')
makedepends=('go')
depends=('curl')
source=("git+https://github.com/rs/curlie.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
