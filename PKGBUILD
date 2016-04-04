# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=pirateflix
pkgver=1.0.14
pkgrel=1
pkgdesc="Stream piratebay movies directly from CLI"
arch=("any")
url="https://github.com/weslleyaraujo/pirateflix#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha1sums=(78f1105c6dd097217908329a39f36a4d92c289fc)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
