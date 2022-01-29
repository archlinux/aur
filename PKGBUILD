# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.0.1
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('1b3b540566db4f922a4dfc5b837be7598a72b465096c024b3ce4478e329cad8b6751037fd22e0244fada9493778e774b5f1cd1d9707286b861ba5aab7d03c532')
b2sums=('257bc5333e8756a890e1de2deee21a11e15881b0d4014a7e93a72da234707aa0f9f86675a303d1dee6b96e6ee9cb4d7c56c27600b6b2381e9614bd09f501e76c')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
