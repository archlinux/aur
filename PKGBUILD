# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.7.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('6c9fd7bc2c3116b98e226d760c7e2b8041540d9f8aced4fb068470d7759e81bed8c51ee0792561a6aecf231e07f63b5a946b830d843896cbff950c63fe476ece')
b2sums=('4b6b97292d2d57d7353410b34ab4f12b5b612d0ae43ff81345d442edaa3816314ff7c0d5dc7cea3af612a21d0db8bcc18c0cb881018536271034426b34f0884d')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
