# Maintainer: David Birks <david at tellus dot space>

pkgname=trello-cli
pkgver=0.3.0
pkgrel=1
pkgdesc='Trello CLI tool'
arch=('x86_64')
url='https://github.com/mheap/trello-cli'
license=(BSD)
depends=('nodejs' 'npm')
provides=('trello')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('53606cc12ead1b4c525e813ae1c8414d35563cd1460215f9e20dffccd106959b834e3d48bbb1051952d6ab1500f05eb7a6b75a7308f5ddf2af1adc12d10fe673')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
