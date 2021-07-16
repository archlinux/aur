# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.52.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('328100f982d0b1f9272ee73677fb95f2f4de86702c009a8e5c2c902ce667dff410fab770505cdab1b8349becd974d31eb297dc1c34d386df825204b6fecbd427')
b2sums=('e8114d7a811f0430ab928294ce1d7b5fe22e91275f028ec008f5a3f8dc97d037dcaa39901839741720f4020189658a1690a67056aa977eabac35fe746ff7ed22')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
