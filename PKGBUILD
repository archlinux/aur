# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.20.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('3187695765b44e073e030cea5eed94d0087a79e55193cb47b285eb50b2dfa996c3cef21312e50993e35af0a84e2c11a6e6de49041be4526bf4f128ba87fea28b')
b2sums=('cc32936c5824603ac35b4f3981d203e462360afcf5c3369beda7550a732421ee115a770c3a7dd0f323512cec1fd962bdfea8fa0d14a36014ff455d64b448021a')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
