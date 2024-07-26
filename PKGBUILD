# Maintainer: Anthony Wang <a aat exozy doot me>

pkgname=plugin-git
pkgver=2.5.2
pkgrel=1
pkgdesc="Woodpecker plugin for cloning Git repositories"
arch=(any)
url="https://github.com/woodpecker-ci/plugin-git"
license=('Apache')
makedepends=('go')
depends=('glibc' 'git' 'openssh' 'curl' 'git-lfs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woodpecker-ci/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('def46c56ddbb4639edace00412ecc642e5800cbcebffcacbe50e94841117a180')

build() {
  cd "$pkgname-$pkgver"

  GOFLAGS=-trimpath make build
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm755 -t "$pkgdir/usr/bin" release/plugin-git
}
