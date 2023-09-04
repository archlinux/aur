# Maintainer: Michael Heap <m at michaelheap dot com>

pkgname=trello-cli
pkgver=0.6.3
pkgrel=1
pkgdesc='Trello CLI tool'
arch=('x86_64')
url='https://github.com/mheap/trello-cli'
license=(BSD)
depends=('nodejs' 'npm')
provides=('trello')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('a6914453c66cc5f54f44d3eb94f41eabfa1d2952b9106c9cc8475ec025ca10f6c5499f88c717f68dc16d608f015db23879400e732bbcfb81835c0c99fff86b46')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
