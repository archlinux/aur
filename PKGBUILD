# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.2.1
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('a1c09f2cab7e0bcad969a97391b767c5e9cf6418d2efcc27671258a83757c77118af87bd28d0f65b24ca52107c83f7f714f4968c65b7e51f5edff31f77f71e4f')
b2sums=('5212308c35d3d3362a5fd7e20e1a70bde263009adce6341f6f0c8971b32a491d58f282f598a6e3b57af93a073a55a952d89b6f31f7b0427749cadd5cf6481c12')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
