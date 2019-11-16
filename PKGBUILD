# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=lefthook
pkgdesc="git hooks manager"
pkgver=0.6.5
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/Arkweid/lefthook"
license=('MIT')
makedepends=('go' 'rsync')
source=("https://github.com/Arkweid/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('3bdb7ff5ddb77cec3ab562b6feb8fb0f5e4cfa66d42459b461d390918f362044')

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