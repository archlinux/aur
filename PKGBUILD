# Maintainer: Pat Brisbin <pbrisbin@gmail.com>

_gitname=vbump
pkgname="$_gitname-git"
pkgver=r10.8dc72bc
pkgrel=1
pkgdesc='Automatically bump package versions'
arch=('any')
url=https://github.com/pbrisbin/vbump
license=('MIT')
depends=('sh')
makedepends=('git')
source=("git+https://github.com/pbrisbin/$_gitname")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
