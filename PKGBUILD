# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.69.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('2a162944c52c11bebd8998c186f8e00111ae3916d4d80efae1a9a2eb95f533e80a5cd84e228f9b2ea1b2cd96336a6e709dd495a8c2dcf37f6c1a6d51e566588e')
b2sums=('5be1d76c6fb643ca2e69a4803bc7645341724b7404287597f3a766eba9eae8fa63e1ec498a534b0199e45f0f464e533475c9b0b12b86e724dc72a11f1b6d83d6')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
