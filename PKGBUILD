# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

_pkgname=ratox
pkgname=$_pkgname-git
pkgver=0.0.0.390
pkgrel=1
pkgdesc="FIFO based tox client"
arch=('i686' 'x86_64')
url="https://github.com/pranomostro/ratox"
license=('custom')
depends=('glibc' 'toxcore')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/pranomostro/ratox.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  echo "0.0.0.$(git rev-list --count HEAD)"
}

prepare() {
  cd "$_pkgname"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
