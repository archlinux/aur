# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=ortle
pkgname=ortle-git
pkgver=21.006d8b9
pkgrel=1
pkgdesc="a simple compositing manager for X"
arch=('i686' 'x86_64')
url="https://github.com/aoba1217/ortle"
license=('BSD')
depends=('mesa' 'libxcomposite')
makedepends=('git' 'libgl')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/aoba1217/ortle.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
