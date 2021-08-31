# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.57.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('fe02f36aa762b0d97298c89024c905a000b2ecd5e439dec4ebbb1b70eac4357b956f8f10012e0f4d3f153e430dbba790a279698466a06ca869a9598acc724399')
b2sums=('0c6bcf55c5db0d28a35653b97bd2a75886530fb44353b2b4506e73d6ddb9eb5db38ed0071cec8737ebe615f0e327fd5075279b190dbf85b80b7c71a2a473e346')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
