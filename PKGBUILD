# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.24.1
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('bfb593a6b4aa8f48c5a0a398d015386bb3fb6ce6073ecbe1871a59b7c389a98ae7ab20106e784ce865db0e29913226ec1f708dbcc55610a0fe5967a2997cdc1f')
b2sums=('d61a9165cd4bd077838023164f2729feee7e4062e0c1a3198ea869eeb2cd618864a6661c18edf313cbfaf4a27f0b0a506cd50dcca1e17fcff971b550ef810cbf')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
