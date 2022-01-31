# Maintainer: David Birks <david at tellus dot space>

pkgname=trello-cli
pkgver=0.5.1
pkgrel=1
pkgdesc='Trello CLI tool'
arch=('x86_64')
url='https://github.com/mheap/trello-cli'
license=(BSD)
depends=('nodejs' 'npm')
provides=('trello')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('2bb3a9373ef2d553c7cdd370953910d935b354e36bd263508e8496a0a0dad9811f10a1b092cf1f363382d82ad18dae8915270348fa67aeb30a700c56a4e759d2')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
