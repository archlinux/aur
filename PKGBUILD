# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.71.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('da2299a9e122d00718a3e8cfc4c4421a658d679e809fe4b4aeb5bcb3dae67523fcb72a7c73018c587412c0fc4c5403ff51601287d13c77caba533a2af2c25c9c')
b2sums=('eb7db4b56890fa0f4947e3bfdb23dadb7f40ba85624a18519bb57425b8e1d89cf61d79fbec38847fb326a98a6c9bb9be6f075862d10b4dac7b6c53e6e7c66374')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
