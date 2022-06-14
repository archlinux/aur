# Maintainer: Atakku <atakkudev@gmail.com>
_npmname=tailwindcss
pkgname=tailwind-css
pkgver=3.1.3
pkgrel=1
pkgdesc="A utility-first CSS framework for rapidly building custom user interfaces."
arch=(any)
url="https://tailwindcss.com/"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('3d124d61d488b61adbf218e6032ca613210df18a3ad53317a73c85529c542de7b2467dd8de0a6fbb0e859514caac9bcaeed85218a467853dfa568bd5c7859e30')
optdepends=()
options=(!strip)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  install "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
