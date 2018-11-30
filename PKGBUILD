# Maintainer: David Birks <david at tellus dot space>

pkgname=trello-cli
pkgver=0.2.1
pkgrel=1
pkgdesc="Trello CLI tool"
arch=(any)
url="https://github.com/mheap/trello-cli"
license=(BSD)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('1b9df9bcc8098966783d044d0dbb95919df70fb4c737112a0551df1492254e42012e65ad15956beb43d008ec32994a2ae2067488773f569519ce0b1543498aba')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}

# vim:set ts=2 sw=2 et:
