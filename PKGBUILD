# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.17.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('33754973c3d6fde97108053fbd078d60f763a779bb32cfd6c84f80facd934c960e541554b90857dacfb8bba1ae953931781177b3cdc4bd7dba78027845d5c24d')
b2sums=('adb9da2a153ed7b4630579ffc6d0e973ce9ec62a65f068ff551c274a9e28aeae3854464c00a87cb964e08497245d6ab1357d48247e10967f1c71115ebffb4153')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
