# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.59.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('1d7521a083a7d14c9e26fb437020c3bec989aa88572ff236cbba93b9fab207fd64a726b469b5bf390fcec761d4b58476767c3cc58f33255dd149db984b9860f4')
b2sums=('e34aad4c1992a964b8fac6a90a0ea46836f3cfde255ed2ee2c4f7cd474ee37eb529b6bc12b1ae0d5fb10d2fed36218719c099e242eac170f81103f346cbb041d')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
