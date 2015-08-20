# Maintainer: Micha Alt <micha.tucker at gmail dot com>

_npmname=broccoli-cli
pkgname=nodejs-$_npmname
pkgver=1.0.0
pkgrel=2
pkgdesc="Global CLI for broccoli.js"
arch=('any')
url="http://broccolijs.com/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
       'LICENSE')
noextract=($_npmname-$pkgver.tgz)
md5sums=('173465398acd8664a30da24439ae6f08'
         '4741c206fc73f1a664bdadd0e4cef754')

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver

  rmdir "${pkgdir}/usr/etc"
}

