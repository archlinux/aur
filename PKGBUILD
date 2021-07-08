# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.51.1
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('a856a744c351bd10bbd157ac109a996fb30cd4fb4bb31b471acd1e821c5973f7b124916bb49952a02d74c7d08fe0d589478c73ef8076991ea14be8e898059002')
b2sums=('be46fde3aa49e31357c53cbbf8ee9aded98cc51701d7051945e03a845fbb366f81c4b3f2813cdf5ebbe84089919cb5e74e9c3e88882712e75a8c7082708dc766')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
