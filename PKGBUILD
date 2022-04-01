# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.10.2
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('b812f003e9d1a17af13938df17794f4bc5b971607cf9c42831f0fff9edf3f28dfd3d103ea27effb9a285ceac9a8aa59f1b0c3caafa6dcfcce737749a3139ae5b')
b2sums=('ceec3efc7c888ff8008055d8648d7bd3ab35dba07fdce02ffb3d169df648f53185052d71c7368e7ad9c936732e8c60d72ad2624735c50c4c0568676ec4e848df')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
