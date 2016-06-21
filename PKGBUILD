# Maintainer: filirom1 <filirom1 at gmail dot com>
# Maintainer: Micha Alt <micha.tucker at gmail dot com>

_npmname=brunch
pkgname=nodejs-$_npmname
pkgver=2.8.2
pkgrel=2
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
sha1sums=('a79983cbec22ba17af4fb91e70907b8748bead8e'
          'c9085a362f482eb4d820575f2b713a1183465d94')

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  rm -r "$pkgdir"/usr/etc
}
