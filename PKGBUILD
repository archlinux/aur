# Maintainer: Anthony Wang <a aat exozy doot me>

pkgname=plugin-git
pkgver=2.0.3
pkgrel=2
pkgdesc="Woodpecker plugin for cloning Git repositories"
arch=(any)
url="https://github.com/woodpecker-ci/plugin-git"
license=('Apache')
makedepends=('go')
depends=('glibc' 'git' 'openssh' 'curl' 'git-lfs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woodpecker-ci/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('903a38058b29a4d1c38789539282ffdcb60e8475c6bb29f7fa7c6771c16264ae')

build() {
  cd "$pkgname-$pkgver"

  GOFLAGS=-trimpath make build
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm755 -t "$pkgdir/usr/bin" release/plugin-git
}
