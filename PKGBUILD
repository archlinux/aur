# Maintainer: Michael Heap <m at michaelheap dot com>

pkgname=trello-cli
pkgver=1.8.0
pkgrel=1
pkgdesc='Trello CLI tool'
arch=('x86_64')
url='https://github.com/mheap/trello-cli'
license=(MIT)
depends=('nodejs' 'npm')
provides=('trello')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('47da07fa56913cbaeecda7b8cd5b16675624d5863f8642eeb574b89b5db7a1664b7f1f206b3e698059d3a20a66e7e8cf128680095aeb59c5b42ae196790570c3')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
