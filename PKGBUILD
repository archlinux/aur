# Maintainer: Michael Heap <m at michaelheap dot com>

pkgname=trello-cli
pkgver=1.0.5
pkgrel=1
pkgdesc='Trello CLI tool'
arch=('x86_64')
url='https://github.com/mheap/trello-cli'
license=(MIT)
depends=('nodejs' 'npm')
provides=('trello')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('37e59e734fa2a313e8910ed5475589b64b5054118d9d7e88d262ff3ea5fd3ff7241d182ab22af0a8f2b321a51299e1daa2d5c17a71293a1fd278c09a404af6ba')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
