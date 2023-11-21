# Maintainer: Anthony Wang <a aat exozy doot me>

pkgname=plugin-git
pkgver=2.4.0
pkgrel=1
pkgdesc="Woodpecker plugin for cloning Git repositories"
arch=(any)
url="https://github.com/woodpecker-ci/plugin-git"
license=('Apache')
makedepends=('go')
depends=('glibc' 'git' 'openssh' 'curl' 'git-lfs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woodpecker-ci/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('d3d194fddeaf9677edeb9327a7e9682530b33bb59dd611ef7e1a5508332962d6')

build() {
  cd "$pkgname-$pkgver"

  GOFLAGS=-trimpath make build
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm755 -t "$pkgdir/usr/bin" release/plugin-git
}
