# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=thingy
pkgver=1.0.1
pkgrel=1
pkgdesc="Utility application used to make collections and quickly access recent and favorite documents."
arch=('any')
url="https://github.com/linuxmint/thingy"
license=('GPL3')
depends=('python-gobject' 'python-setproctitle' 'xapp' 'xreader')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5efde7cd367d16c680306e7fb036bc513a514bfd8486741e7a100eec90afd1bf')

prepare() {
  cd "$pkgname-$pkgver"
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
