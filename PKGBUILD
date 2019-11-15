# $Id$
# Maintainer: Sean V Kelley <seanvk@posteo.de>

pkgname=jitterdebugger-bin
pkgver=r106.daeff0a
pkgrel=2
pkgdesc="Real time response measurement tool (binary)"
arch=('x86_64')
url="https://github.com/igaw/jitterdebugger"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('jitterdebugger')
options=('!emptydirs')
changelog=
source=("file:///$pkgname-$pkgver.tar.gz")
sha256sums=('3ac105bfde7dfc7ffca649964dd7619cd50736ce6c69f5f7ac2c9e8f919c8a8e')

package() {
  tar -zxf "$pkgname-$pkgver.tar.gz"
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "jitterdebugger.1" "$pkgdir/usr/share/man/man1/jitterdebugger.1"
  install -Dm755 "jitterdebugger" "$pkgdir/usr/bin/jitterdebugger"
}
