# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.1.1
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('a2a6da40455e62cd1e32dcf5a6029b6cfa0fe776da870305dcc689abf62207b6baf9e4ac3b3379390250a01b7902fcfb0d5d8f8dca699f10fabdfef3e152d229')
b2sums=('11a1cdb155655a2bef8bc78ddec17c3e8f72736b21c46bb3a188abf78375b0a104bb45bc81682ea971d5264ee6efd2f2e7798dd0f291009023afc7448e05f341')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
