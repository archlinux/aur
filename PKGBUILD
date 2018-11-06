# Maintainer: Felix Höffken <felix at ctrl.alt.coop>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

_npmname=@feathersjs/cli
_npmver=3.8.7
pkgname=nodejs-feathers-cli
pkgver=${_npmver}
pkgrel=1
pkgdesc="The command line interface for Feathers applications"
arch=(any)
url="https://github.com/feathersjs/feathers-cli#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz)
noextract=(${_npmname}-${_npmver}.tgz)
sha256sums=('269af536495ca4007323528af9de5654fdeb8a595dea0897c081da2f38b42a4b')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
