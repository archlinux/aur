# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.65.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('129a97dbe47a7c8c8b2e21bfb4d7fe4efb283b4dc229dc8e4c2e0c070bae434139ffb86dcb58a0e2cf7f390f5b95c6730fb971a38ec8cf003a1677861ab35675')
b2sums=('da3980c88bd77e13a6bf21579a38092ee5c25f7cc83fe8126ee3e1a8c5ae3b952ee9f96f21bb2b42b656dcd86a2c26f97afebcff879d594157fdb89d4b69054d')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
