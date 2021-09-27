# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.60.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('02500509fd63ae70f156c26560edd8ad316b99b30b3fd16acd0408db2278b3be6d77993abbcade4d336e5f00bd63af32c825f9aafd55b0e9589efed5cd0b0d94')
b2sums=('d887efa1d6077acb5322bea9886d0919c1e5f09691d1afab1abb0893021297dc08ec76e02d2a332714bac85d13a9c65f41c8ea1e910b55207481a9844c848e9b')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
