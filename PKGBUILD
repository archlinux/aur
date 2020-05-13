# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=nodejs-buster
_npmname=buster
pkgver=0.8.0
pkgrel=1
pkgdesc="Buster.JS JavaScript Test framework. Meta package that pieces together various sub-projects."
arch=('i686' 'x86_64')
depends=('nodejs' 'npm' 'python2')
url="https://github.com/busterjs/buster"
license=('MIT')
provides=('buster' 'nodejs-buster')
conflicts=('buster')

source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('aaac7f7743553142ca31e59843263d60f674d34ba44acc9f094c5df7cb9c9fce')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" --python=/usr/bin/python2 $_npmname@$pkgver
}
