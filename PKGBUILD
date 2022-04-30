# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.16.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('cff515df693e3e2a628ba095b5a0930e46b9fab604c54c2f1742b1f3cd3c821afb32cb567257cbf35c780860e85d24e2c5113f96eb362872d07dd9639ee9c19c')
b2sums=('95cc3480d30c8cf175b4fe0d451cb227600e486abc55fcb56163c8b87259fb10edac99d2f9ff07828ae7a9275fc9f596451f9574e72617365b8668f2910d1aec')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
