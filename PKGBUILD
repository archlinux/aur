# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.15.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('e77b559c35dbce1c551f8409c2a64f21bfd6fdc3a8ccda304cc3a632e8a05fdc64d11d0f548ddfd85df48ddd0d3b7110b42acbdbe1aaf5865d50902395db590a')
b2sums=('438498d7a4c66e54d4f0af7c45b7b1f4bad71a25e11590bb42b5dbfa9121ba57054bf28f59eb6ba225efef16dc7d51124d8617d6c4feb4dd53af990d15a47a9f')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
