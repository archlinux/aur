# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.18.2
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('69a7665cf4ec50ac8e8c7618be3009f40dd4d29c810868a74ca3047dfcd1c20d5c409ac1094ab152abd6127f35e12f619078632d1eb8b760fc34eddc319ab6d3')
b2sums=('71a24ee16b0ee3fe4eb55b38034baecf96d85e3503e9f9258448a11186e8690a1b3a3fcb30c311a3417bf9149ab6f5f004faf584c0c82a42a2eb6080c9d7aa0e')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
