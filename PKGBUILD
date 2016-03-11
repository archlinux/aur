# Maintainer: Corentin Peuvrel <corentin.peuvrel at gmail dot com>
pkgname=usleep
pkgver=1.0
pkgrel=2
pkgdesc="A simple C wrapper of glibc's function"
arch=(x86_64)
url=http://linux.die.net/man/3/usleep
license=('MIT')
depends=('glibc')
source=("usleep::git+git://github.com/cpeuvrel/usleep-aur")
md5sums=('SKIP')

build() {
  cd "$srcdir/usleep"
  make
}

package() {
  cd "$srcdir/usleep"

  make PREFIX="$pkgdir/usr/bin" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
