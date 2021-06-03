# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=notparadoxlauncher
pkgver=1.3.1
pkgrel=2
install=$pkgname.install
pkgdesc='Alternative for Paradox Launcher'
arch=(x86_64)
url='https://github.com/shusaura85/notparadoxlauncher'
license=(MIT)
depends=(qt5pas)
makedepends=(lazarus)
source=("https://github.com/shusaura85/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('475db848596d4c05db8e628a69e1477092291d962fe92e2972525e2c848262a2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  lazbuild --lazarusdir=/usr/lib/lazarus linux-src/*-src/*.lpi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dt "$pkgdir/usr/bin" \
          linux-src/launcher-src/output/launcher \
          linux-src/bootstrapper-src/output/bootstrapper-v2
  install -Dt "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
