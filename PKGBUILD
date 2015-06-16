# Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
pkgname=nodejs-buster
_npmname=buster
pkgver=0.7.18
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
sha1sums=('c0ecca209ef956e81f2222393f60a80fd55b60b4')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" --python=/usr/bin/python2 $_npmname@$pkgver
}
