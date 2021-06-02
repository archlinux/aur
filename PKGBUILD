# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=rollup
pkgver=2.50.5
pkgrel=1
pkgdesc="Next-generation ES6 module bundler"
arch=(any)
url="https://rollupjs.org/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

sha256sums=('88564e95b4116557910da2437166eba37a07525b592981dbcb30caf642b23b0d')
