# Maintainer: wicastC <wicastchen at hotmail.com>

pkgname=nake
pkgver=1.8
pkgrel=2
pkgdesc='Describe your Nim builds as tasks'
arch=('x86_64' 'i686')
url="https://github.com/fowlmouth/nake"
license=('MIT')
depends=('nim>=0.11.2')
makedepends=('nimble')
source=("https://github.com/fowlmouth/nake/archive/v$pkgver.tar.gz")
md5sums=('SKIP')


install="$pkgname.install"

build() {
  cd "$srcdir/$pkgname-$pkgver"
  nimble build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "nake" "$pkgdir/usr/bin/nake"
  install -Dm644 "nake.nim" "$pkgdir/usr/lib/nim/nake/nake.nim"
  install -Dm644 "nakefile.nim" "$pkgdir/usr/lib/nim/nake/nakefile.nim"
  install -Dm644 "nakelib.nim" "$pkgdir/usr/lib/nim/nake/nakelib.nim"
  install -Dm644 "LICENSE.rst" "$pkgdir/usr/share/licenses/nake/LICENSE.rst"
}

# vim:set ts=2 sw=2 et:
