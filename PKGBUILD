# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.3.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('ef331da85cabda9d20103dd9dc6ac0cbc0a3d27cc93b033c92c8a18f9dd302d1b15b82b2eb95d388a3d80a2a8022d1663ae6e2619a9504ccbfe91feb165f4c09')
b2sums=('43a610a06bc3a086d38ac4f5f6fb40edd59810eccce7aa61639d607e6cae1befcbed9c2340c037b4b8dc0b99aecb1d8864a5ae5ded348c6957a3d9f06dc5003e')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
