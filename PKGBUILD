# Maintainer: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# vim: set expandtab ts=2 sw=2:

pkgname=gx
pkgver=0.11.0
pkgrel=1

pkgdesc="Packaging tool built around the distributed, content addressed filesystem IPFS. It aims to be flexible, powerful and simple."
url="https://github.com/whyrusleeping/$pkgname"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')

depends=('glibc')
optdepends=('gx-go: gx packaging module for go')
makedepends=()

_srcroot="https://ipfs.io/ipns/dist.ipfs.io"
source_x86_64=("$_srcroot/$pkgname/v$pkgver/gx_v${pkgver}_linux-amd64.tar.gz")
source_i686=("$_srcroot/$pkgname/v$pkgver/gx_v${pkgver}_linux-386.tar.gz")
source_armv7h=("$_srcroot/$pkgname/v$pkgver/gx_v${pkgver}_linux-arm.tar.gz")

sha512sums_i686=('9ee10253104ca358038a26a828f097b78abe86ac4f58a92610d4a46bad5bd6ec7f5f3ab04450512ca5389f1dc3396448b5d395e583a788fca6a1e1fd989cc877')
sha512sums_x86_64=('dce8ce3fb7384cbd5f70db5089b689a44e0488428d62f5cbaa46a7d8c18cf8572fd558ebe8018c525b02cc3c017df1017d7918d2ada3e8151189ab8af8cde538')
sha512sums_armv7h=('f7e02cb40bc49e53ab900958237c74cfc072ac35b2c04bc0633fd8c336b42ae1497349985c31ebd2c4b9197edb27270d912877b7fcbe9d385751ca69907d80e9')

package() {
  install -Dm 755 ${pkgname}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
