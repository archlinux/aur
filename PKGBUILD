# Maintainer: Wesley Moore <wes@wezm.net>
_pkgname=kati
pkgname=kati-git
pkgver=20190122.c959cc1
pkgrel=1
pkgdesc="An experimental GNU make clone"
arch=('i686' 'x86_64')
url="https://github.com/google/kati"
license=('Apache')
depends=('ninja' 'bash')
makedepends=('git')
source=('git+https://github.com/google/kati.git')
conflicts=(kati)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  install -Dm755 "${srcdir}/$_pkgname"/ckati "${pkgdir}/usr/bin/ckati"
}

# vim:set ts=2 sw=2 et ft=sh:
