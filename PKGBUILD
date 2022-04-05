# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.11.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('bf8c9f28e2b8eab8b5d93922b8d7d4acba3e3eb7d1e0123d5a4ad4c4f17ae82b2deca76ed511f4aa2080e86c6989b6aea31fbe8276f109d82827e5cac3d9efd6')
b2sums=('d963c8925cbe8b6b569c6ce196af7e90920a23eb4039316933ab54537fce707d3b9057bd704cfe9e5fa32b2e4055920933eee23d0394928f266eb17b20d4ef30')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
