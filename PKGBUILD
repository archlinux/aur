# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.72.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('a4ad1002d0a74b2de1699de6a895f9d18c3e157bf1fbe25e11f5ff0f4d0e0e949228f57b67a0b5378fc9650c3f91791f6152bae953b76f380a89b1eed9bd3faa')
b2sums=('7849d8179f35d1be8e5052f3dec0eb8970492a99eb7951c1096c291563a2b5ca3f24c778cb50c398b3ab3ba9557d165dc1ef7e4b0cc4a58de3386809e009b1e7')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
