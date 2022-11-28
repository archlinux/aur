# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.25.1
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('145c82dfed6260f7db54a44731c3ea90644dcd7460220f3fc2c1be748e3da001aa4fc63b2d70d134277bc2e1b25d19517f621748c5f319312610508524fb62df')
b2sums=('dee70ee5007ac52bab1f2c16cfc2d058da68d902dab0d4e1e7caa7a351d09d92dcd4aeb4328ebf7adf41dd8e22272477a02c843d797d305c47c04410c4f96890')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
