# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=lefthook
pkgdesc="git hooks manager"
pkgver=0.6.6
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/Arkweid/lefthook"
license=('MIT')
makedepends=('go' 'rsync')
source=("https://github.com/Arkweid/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('9c98c98794846a13c2352c8da8d037548ce81bfc1dc1ab0a45fc5d8de9214031')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}