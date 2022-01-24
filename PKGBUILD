# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.72.2
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('c65c5a5b2ab86f9f03217de9af02229019978f4cf847e608f737033d881073bf26289d2a4e008aec1328cba76556e1d79df8419214f7b93fc4845be3288764ea')
b2sums=('a94f7110e28c32235269e8de0abf39c2d64c3ed097e5261853fda5135c583091d74cc5e02ba92e24cbf5081f0c50317f5abb057f0f26d594988018140d05843b')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
