# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.25.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('6ce51a5035a69fd99c1da29ef60805f349c6b0fff3f5900a7b7de7fab46c65b5d9a5c097ca3430728018c010d2f4240ed61760b8ddc995e15feb7ed855175fbf')
b2sums=('f0c9f79645038277d49519cf7b3532d146ce9091e8de4650e8b2604036d9dc02db1bcdfa6dfff6f00afd2566cedb6b5338c820762b5059676864040e493fc58c')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
