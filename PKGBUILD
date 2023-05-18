# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.31.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('17e67875b59532613343ca5191c26a51f2e38e3d0a855107230ef182e54f5b3e')
b2sums=('90e242814947ed5e224d8791d05226d590a3e5300e76e68a66ba664ceb1127f9c30d92ec6eb836f5fd83c3a353bc69758cc06970db0d7e91a7bdf66bc371f888')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
