# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=thingy
pkgver=1.0.2
pkgrel=1
pkgdesc="Utility application used to make collections and quickly access recent and favorite documents."
arch=('any')
url="https://github.com/linuxmint/thingy"
license=('GPL3')
depends=('python-gobject' 'python-setproctitle' 'xapp' 'xreader')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6e8f1f4702c723dc93ff4e93804a65f85af62e0706794768f9214eaebf81be01')

prepare() {
  cd "$pkgname-$pkgver"

  # Set version in About dialog
  sed -i "s/__DEB_VERSION__/${pkgver//+*/}/g" "usr/lib/$pkgname/$pkgname.py"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r usr "$pkgdir"
}
