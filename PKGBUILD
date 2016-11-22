# Maintainer:  benutzer193 <registerbn+arch a_t gmail d_ot com>
pkgname=flips-git
_pkgname='Flips'
pkgver=r21.45de4fb
pkgrel=1
pkgdesc="Patcher for IPS and BPS files"
arch=('any')
url="https://github.com/Alcaro/Flips"
license=('GPL3')
provides=('flips')
optdepends=('gtk3: GUI support')
makedepends=('git')
source=("git://github.com/Alcaro/Flips.git")
install=flips.install
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)"\
    "$(git rev-parse --short HEAD)"
}
build() {
  cd "$srcdir/$_pkgname"
  make
}
package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "flips" "$pkgdir/usr/bin/flips"
}
