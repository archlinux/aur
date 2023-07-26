# Maintainer: Anthony Wang <a aat exozy doot me>

pkgname=plugin-git
pkgver=2.1.0
pkgrel=1
pkgdesc="Woodpecker plugin for cloning Git repositories"
arch=(any)
url="https://github.com/woodpecker-ci/plugin-git"
license=('Apache')
makedepends=('go')
depends=('glibc' 'git' 'openssh' 'curl' 'git-lfs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woodpecker-ci/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('9cb8a22adaddd3844e69800d1c5c54e15e05fa9e30e9d68089938293116fb2dc')

build() {
  cd "$pkgname-$pkgver"

  GOFLAGS=-trimpath make build
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm755 -t "$pkgdir/usr/bin" release/plugin-git
}
