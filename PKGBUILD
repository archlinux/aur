# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.54.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('cff7154748e0ed03766113fd4af70918cda764f188d9bf845b1adb272dcf7d8d558417c9b0e0d08e47703a9b268985715fc518c4eae33b9d3b249466d859f703')
b2sums=('29b59523f128252a7adfaf4f7315f8346956711368df5fcc7e207186fe0d14ee32ccc2ffd1b1c79e3e03156d8530126636c5c09e0efde9df891e57723040a567')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
