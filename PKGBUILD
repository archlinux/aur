# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=bterm
pkgver=1.0.0
pkgrel=3
pkgdesc="cross-platform terminal emulator"
arch=('x86_64')
url="https://github.com/bleenco/bterm"
license=('MIT')
conflicts=('bterm-git')
depends=('nodejs')
makedepends=('unp')
source=("https://github.com/bleenco/bterm/releases/download/v1.0.0/${pkgname}_${pkgver}_amd64.deb.zip")
sha256sums=('31f866b1d8fe0c629747428476ed671e4be9d9779eb30308b2270c4f3554a51d')

package() {
	cd "$srcdir"
  unp bterm_1.0.0_amd64.deb
  unp data.tar.xz
  cp -r usr $pkgdir
  cp -r opt $pkgdir
  install -d $pkgdir/usr/bin
  ln -s /opt/bterm/bterm $pkgdir/usr/bin/$pkgname
}
