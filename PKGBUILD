# Maintainer: Gabriel de Oliveira <gabrielhk3 at gmail dot com>

pkgname=cp437
pkgver=0.6
pkgrel=1
pkgdesc='Emulates an old-style "code page 437" / "IBM-PC" character set terminal on a modern UTF-8 terminal emulator.'
arch=('x86_64')
url='https://github.com/keaston/cp437'
license=('custom')
source=('git+https://github.com/keaston/cp437.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 cp437 "$pkgdir/usr/bin/cp437"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
