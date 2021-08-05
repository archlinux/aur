# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.53.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('dacac96b9e5d418e24c7e68d1a47afbd96c9ffc8ff0b54cb0f702f65da6a82b44f346e35c9f97507757fa57326ab9b1f769c74f45afc24e78d460520254abb03')
b2sums=('e376dcee08db31c5610f8cbf7d84a789ba64e4b7e8682f7694bbe3740a4e7f96430dc3d46977f7ccd506c51657421cc7fd3cd0b7a6c2f7949c1e64783f06a339')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
