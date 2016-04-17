# Maintainer: filirom1 <filirom1 at gmail dot com>
# Maintainer: Micha Alt <micha.tucker at gmail dot com>

_npmname=brunch
pkgname=nodejs-$_npmname
pkgver=2.6.6
pkgrel=1
pkgdesc="A lightweight approach to building HTML5 applications with emphasis on elegance and simplicity."
arch=('any')
url="http://brunch.io/"
license=('MIT')
depends=('nodejs' )
makedepends=('npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
        'LICENSE')
noextract=($_npmname-$pkgver.tgz)
sha1sums=('4253eac8fb47e5b6e03610c386bbe6470f8d38ca'
          '33743a055a6ce2165bde37eebca24f3c05ad9583')

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  rm -r "$pkgdir"/usr/etc
}
