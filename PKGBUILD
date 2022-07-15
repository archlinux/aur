# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.21.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('b300e7d760d610dde3c9bfc33ebafe6b91b2f83715f9c23e62e8a2fb38f11933c6ac40df2f298f044b71ddeed89b12969f5ef87a499109f44d6dbb5f7e8dcb71')
b2sums=('06981956212a469e9eab8a1be6026cdd8e6d2dd3748683f45a4ff4c62663229b210bd935f1697a9f85b2c27d572253471c8666e27bd86c95e978a8155bc711c1')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
