# Maintainer: Jonne Haß <me@jhass.eu>
_repo="znc-backlog"
pkgname=znc-backlog-git
pkgver=r55.5cd43b0
pkgrel=1
pkgdesc="A ZNC module that makes it easy to request backlog"
arch=('i686' 'x86_64')
url="https://github.com/FruitieX/znc-backlog"
license=('Apache')
depends=('znc')
source=("git+https://github.com/FruitieX/znc-backlog.git")

pkgver() {
  cd "$_repo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_repo"
  make
}

package() {
  cd "$_repo"
  install -Dm755 backlog.so "$pkgdir/usr/lib/znc/backlog.so"
}
sha256sums=('SKIP')
