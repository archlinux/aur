# Maintainer: Atakku <atakkudev@gmail.com>
_npmname=tailwindcss
pkgname=tailwind-css
pkgver=2.0.4
pkgrel=1
pkgdesc="A utility-first CSS framework for rapidly building custom user interfaces."
arch=(any)
url="https://tailwindcss.com/"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('ede6c9bf95f67b439b20310e9e574459beb33ac571a666ffa07f9c9c1fc2d2b2')
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
