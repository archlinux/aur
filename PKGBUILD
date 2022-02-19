# Maintainer: Anthony Wang <ta180m@pm.me>

pkgname=plugin-git
pkgver=1.1.1
pkgrel=1
pkgdesc="Woodpecker plugin for cloning Git repositories"
arch=(any)
url="https://woodpecker-ci.org/docs/usage/pipeline-syntax#clone"
license=('Apache')
makedepends=('git' 'openssh' 'curl' 'go')
depends=('glibc')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/woodpecker-ci/$pkgname/archive/v$pkgver.tar.gz"
)

build() {
  cd "$pkgname-$pkgver"

  GOFLAGS=-trimpath make build
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm755 -t "$pkgdir/usr/bin" release/plugin-git
}
sha256sums=('b3dd0a3600964d6b3c2a1b135d1e88c5a9a5d068d58b2d98c1a64d2ee02587df')
