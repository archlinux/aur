# Maintainer: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# vim: set expandtab ts=2 sw=2:

pkgname=gx
pkgver=0.12.1
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

sha512sums_i686=('5388716b3991fa5573a5334cf90b71ed934df1ecdbbb4691252d0afa0a310853bfef7461fc9efd9bc41c54d7a775cb82279c9563766319b85f33cffcff191fa7')
sha512sums_x86_64=('9f331cc0bcf46bbd00a2ae37b4dd540c71701be971292d6d8cc2c73c7de4fc714dcc01467719b18502dac3643fe1ba11ac0fc3797d9393b10c487ca34bcc558e')
sha512sums_armv7h=('bcf860f57a2cd9ef7c9f005a56038b3807de359a3e2edf7638ae1733ad88ced941bfdc6b52c19fdcc7e3b3905bea192d55acbc581b2f316fd7d47980fe435c3f')

package() {
  install -Dm 755 ${pkgname}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
