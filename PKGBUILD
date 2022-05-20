# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.18.1
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('71d51d1bb456ff4036b1f4e75d5c070201d3399e27b78e656d875dc91dab3035d24fee821a084f68aee2e9cee9755f1452e536892d34cbf4794f0b4a154f403a')
b2sums=('9d8d30dbba6df6348aabf874065fa45e8978e5337b38538fd7a1af55fcf523dd67ae36a03f61fff82f29c5ebc7a689a990f2b6d14c493e071812df5aa117b1d5')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
