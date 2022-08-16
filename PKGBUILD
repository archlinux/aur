# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.22.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('4bf0b88db4c55bde40c00c36c12a906b6f050a8add1f08feb14b774873e02cdab4af259c6a0474dc2eefbc8127ba799bed18f9b8421cbc0ae68ee698358374fb')
b2sums=('a553c639ea20d88d2f837b75c2d9a25a94459b823479d4318bffa90e3c4fd50c8a333030cd11da8e8754f30fac14d4c880edc703cc399cbd4f3056020d2f4170')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
