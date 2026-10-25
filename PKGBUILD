# Maintainer: Michael Heap <m at michaelheap dot com>

pkgname=trello-cli
pkgver=2.0.0
pkgrel=1
pkgdesc='Trello CLI tool'
arch=('x86_64')
url='https://github.com/mheap/trello-cli'
license=(MIT)
depends=('nodejs' 'npm')
provides=('trello')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('52ec9b1192878104b5ca8f5fa5f8b1e774bcccb776645c437d5645f1d22ee31b5dadd0740fa5f8f5bc328549399919d500a7072b4a1fb07c93f40825feaeac35')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
