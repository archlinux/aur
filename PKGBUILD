# Maintainer: Michael Heap <m at michaelheap dot com>

pkgname=trello-cli
pkgver=1.4.0
pkgrel=1
pkgdesc='Trello CLI tool'
arch=('x86_64')
url='https://github.com/mheap/trello-cli'
license=(MIT)
depends=('nodejs' 'npm')
provides=('trello')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('a586381c38d06bd6ad93b21d7707a96dc6b87bcac4506a8fcf688d4ae4ea74057ca4fd5dfe13206cfebce252c45698527b8fccdf9e50eac4b8b57c84e8adadc0')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
