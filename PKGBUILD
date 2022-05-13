# Maintainer: Atakku <atakkudev@gmail.com>
_npmname=tailwindcss
pkgname=tailwind-css
pkgver=3.0.24
pkgrel=1
pkgdesc="A utility-first CSS framework for rapidly building custom user interfaces."
arch=(any)
url="https://tailwindcss.com/"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('1f7b8c999356cc6e9aaa683dab4ed92113486b0a2211c3452837cbf98cce3ee3ec5ee0d7c49c41f6272accb81dcca3708c6dd202ba3687d4986aff1ec173608a')
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
