# Maintainer: Andrés J. Díaz <ajdiaz@ajdiaz.me>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

_npmname=thumbsup
_npmver=2.15.0
pkgname=nodejs-thumbsup # All lowercase
pkgver=${_npmver//-/}
pkgrel=1
pkgdesc="Photo / video gallery generator"
arch=(any)
url="https://github.com/thumbsup/thumbsup#readme"
license=()
depends=('nodejs' 'npm' 'perl-image-exiftool' 'graphicsmagick')
optdepends=('ffmpeg: for video support')
makedepends=('git')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('247542a20b1fbd0498c949c1dab710a14c1a550248a35ccc09bbec52c5204700')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm update
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
