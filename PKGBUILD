# Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_npmname=pulp
pkgname=nodejs-$_npmname
pkgver=4.4.0
pkgrel=1
pkgdesc='A build system and package manager for PureScript projects.'
arch=('any')
url='https://github.com/bodil/pulp'
license=('LGPL3')
depends=('npm' 'nodejs')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
md5sums=('15450ae6048ca23ff2e01524bb0c3eca')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
