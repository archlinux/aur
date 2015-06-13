# Maintainer: mar77i <mar77i at mar77i dot ch>
pkgname=bulk77i-git
_pkgname=bulk77i
pkgrel=1
pkgver=v0.2.4.g4b04119
pkgdesc="mar77i's basic C datatypes collection"
arch=(x686 x86_64)
url="https://github.com/mar77i/bulk77i"
license=('GPL')
makedepends=('git')
source=("git+https://github.com/mar77i/bulk77i.git")
md5sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --tags |sed 's/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  local lpfx="/usr/share/licenses"
  cd "$srcdir"
  make -C "$_pkgname" DESTDIR="$pkgdir/" PREFIX=/usr install
  install -m644 -D "$_pkgname/LICENSE" "$pkgdir/$lpfx/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
