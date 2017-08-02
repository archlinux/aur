# Maintainer: Tony Crisci <tony@dubstepdish.com>
pkgname=i3-style
pkgver=0.10.0
pkgrel=1
pkgdesc="Add styles and colorschemes to i3wm"
arch=('any')
url="https://github.com/acrisci/i3-style"
license=('custom:BSD 2-Clause')
depends=('nodejs')
makedepends=('npm' 'coffee-script')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=("eec470851b87304f18465c859759d3767acd6c141736c49d2fd49c172b114519")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}

# vim:set ts=2 sw=2 et:
