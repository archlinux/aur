# Maintainer: Anthony Wang <a aat exozy doot me>

pkgname=plugin-git
pkgver=2.1.1
pkgrel=1
pkgdesc="Woodpecker plugin for cloning Git repositories"
arch=(any)
url="https://github.com/woodpecker-ci/plugin-git"
license=('Apache')
makedepends=('go')
depends=('glibc' 'git' 'openssh' 'curl' 'git-lfs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woodpecker-ci/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ff40aaa13d170585471e1c004e92aee0c15cea6a135e78624d293f2c1fc891ea')

build() {
  cd "$pkgname-$pkgver"

  GOFLAGS=-trimpath make build
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm755 -t "$pkgdir/usr/bin" release/plugin-git
}
