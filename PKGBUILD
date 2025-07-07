# Maintainer: XhuyZ <https:github.com/XhuyZ>
pkgname=lazysys-git
pkgver=r12.cd44fe5
pkgrel=1
pkgdesc="A TUI tool to manage systemd services"
arch=('x86_64')
url="https://github.com/XhuyZ/lazysys"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'make')
source=("$pkgname::git+https://github.com/XhuyZ/lazysys.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make build
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/lazysys "$pkgdir/usr/bin/lazysys"
}
