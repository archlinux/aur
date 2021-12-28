# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.70.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('36869aca524580385b1162dab21adeae57bc8f1df96fa886745decfa060ece3f30bcb84c385deb7d6cde28dc820555c2d2ccb1d50e5a62069854750ccd7ce64b')
b2sums=('a4bd57349ce74970449c5557c19c9d1414a74e00339e04b989c614a4a2bd45690e274575614a6104574313f684153c89eca3da0db5bcaad8c5754ffca21cb6e7')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
