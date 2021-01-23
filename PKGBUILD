# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=esbuild
pkgver=0.8.34
pkgrel=1
pkgdesc="An extremely fast JavaScript/TypeScript bundler and minifier"
arch=(any)
url="https://github.com/evanw/esbuild"
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

sha256sums=('14149f58b47224d1a2e369e9bb80669c6e939ed9e0eb2278530fed87b6c24a46')
