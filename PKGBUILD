# Maintainer: M0Rf30

_pkgname=composer-cli
pkgname=hyperledger-${_pkgname}
pkgver=0.11.3
pkgrel=1
pkgdesc="A framework for building Blockchain business networks: Contains the Hyperledger composer CLIs for administering business networks"
arch=(x86_64)
url="https://github.com/hyperledger/fabric"
license=('APACHE')
groups=('hyperledger-composer')
depends=('nodejs')
makedepends=('npm')

package() {
  cd $srcdir

  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" composer-cli@$pkgver

msg2 "Renaming composer to composer-cli (it's not php composer)"
  mv $pkgdir/usr/bin/composer $pkgdir/usr/bin/composer-cli
}

