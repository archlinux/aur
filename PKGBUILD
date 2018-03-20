# Maintainer: 
#   * Bram Swenson <bram at craniumisajar dot com>
# Contributors: 
#   * Will Price <will.price94+aur@gmail.com>

_npmname=livedown
_npmver=2.1.1
pkgname=nodejs-livedown # All lowercase
pkgver=2.1.1
pkgrel=1
pkgdesc="Live Markdown previews for your favourite editor."
arch=(any)
url="https://github.com/shime/livedown"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha512sums=('0b9c75dbe6f093b9b64b1dd4dbb559ee1e4a3fbbc894a7d918269b322ef79c11a9d333c7b426b14133d70d1a17e78efd11952fc9c609234683e21d5de3e76cef')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
