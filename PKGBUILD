# Maintainer: Achilleas Pipinellis <axilleas archlinux.info>

_npmname=svgexport
_npmver=0.3.2
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc='Node.js module and command-line tool for exporting SVG to PNG and JPEG.'
arch=(any)
url='https://github.com/shakiba/svgexport'
license=('MIT')
makedepends=('npm' 'phantomjs')
depends=('nodejs')
provides=('nodejs-svgexport')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
md5sums=('c3c55197f7fde41a62107b63f9947cc7')
