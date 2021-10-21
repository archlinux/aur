# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.64.1
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('f4312bb15e000a0ff65244685f6118464703c918b734195dfe07b109e56792652e9da752c279ad48179553cb29be0fb373ad5bd6f6eeb131c4e30a2a71dda0bf')
b2sums=('56a0abff93e7fc4e02b997eef77a76d6e16cf7966425f5b224beaf7d1e6d070c26b57749621c3957862b2bf835a3e7a1551be9079e69d1b18322e2a90a9f4679')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
