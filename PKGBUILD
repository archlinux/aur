# Maintainer: M0Rf30

_pkgname=composer-playground
pkgname=hyperledger-${_pkgname}
pkgver=0.11.0
pkgrel=1
pkgdesc="A framework for building Blockchain business networks: The UI for Hyperledger Composer"
arch=(x86_64)
url="https://github.com/hyperledger/composer"
license=('APACHE')
groups=('hyperledger-composer')
depends=('nodejs-lts-boron')
makedepends=('npm')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" ${_pkgname}@$pkgver
  npm prune --production
}
