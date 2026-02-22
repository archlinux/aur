# Maintainer: Michael Heap <m at michaelheap dot com>

pkgname=trello-cli
pkgver=1.5.0
pkgrel=1
pkgdesc='Trello CLI tool'
arch=('x86_64')
url='https://github.com/mheap/trello-cli'
license=(MIT)
depends=('nodejs' 'npm')
provides=('trello')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('c12d08e349ec42b8ab0c97eb27fb75ed9d01418e409e07c8614148c3a071664c71237e992aa03230d6200dc5f101a31a405f5ef7a6a06d62013c5a2c88c50c9b')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
