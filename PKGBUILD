# Maintainer: Ben Edwards <ben@artfuldodge.io>
pkgname=web3j
pkgver=3.5.0
pkgrel=1
pkgdesc='A lightweight, reactive, type safe Java and Android library for integrating with nodes on Ethereum blockchains'
arch=('any')
url='https://web3j.io/'
license=('Apache')
depends=('java-runtime>=8')
source=('web3j'
        "https://github.com/web3j/web3j/releases/download/v${pkgver}/web3j-${pkgver}.tar"
        "https://github.com/web3j/web3j/releases/download/v${pkgver}/web3j-${pkgver}.tar.asc")
sha256sums=('410a2c96c3dfcf1db1a3db0de346e25334b7b8b817bece714559845f21a65a57'
            'a67f7ba3216806305b8def174483cd26057ecf8d3af909dfbc11d03750198969'
            'SKIP')
validpgpkeys=('99854D26AD9C565C34BCE2471295E078F64311DB')
package() {
  cd "$pkgname-$pkgver"
  install -D -m644 -t "$pkgdir/usr/share/java/web3j" lib/*
  install -D -m755 "$srcdir/web3j"  "$pkgdir/usr/bin/web3j"
}
