# Maintainer: Michael Heap <m at michaelheap dot com>

pkgname=trello-cli
pkgver=1.2.0
pkgrel=1
pkgdesc='Trello CLI tool'
arch=('x86_64')
url='https://github.com/mheap/trello-cli'
license=(MIT)
depends=('nodejs' 'npm')
provides=('trello')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('f114d5948200137b031e7e18a300b4aeda17d3f70544480ab25e8f38c4cb5c29f4c2920ca34d2cbdc895ee92e7b3b099e7fd590f93a1a86d82e86f6997c224dc')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
