# Maintainer: HoskeOwl <hoskeowl at gmail dot com>

pkgname=csxlock-git
_pkgname=csxlock
pkgver=1.1.r20.g0cd844b
pkgrel=1
pkgdesc="Simple screen locker utility for X, fork of sxlock. Uses PAM authentication, suid needed (tty lock)."
arch=('i686' 'x86_64')
url="https://github.com/HoskeOwl/csxlock"
license=('MIT')
depends=('libxext' 'libxrandr' 'pam' 'ttf-droid')
makedepends=('git')
source=('git://github.com/HoskeOwl/csxlock.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's|^v||;s|\([^-]*-g\)|r\1|;s|-|.|g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
