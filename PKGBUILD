# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.72.1
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('4b19b1c8181642f70abc45dd3f47d1dd8fa7963390fa75823c36579e189cfffc3e93490d43f6c771ddd2d55650a94de6ee7659c0cb1d0b9971076e84a541442c')
b2sums=('88f898e278eeac8919b997c7f6757fdad9d1a04ddcd47cb0bdd8f64747181477358b88af922c553ae4b7d0057ca10244c3b20695f361b5b46e23edb62fa5d52d')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
