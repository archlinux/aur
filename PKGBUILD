# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.51.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('3e2d86c19a3584b5d49952206054e39dcdb7d59e246e4db8d191cdd9b670eadc27897f908ae248be60cd89555413165ed0bccbf6269e7ee19de80b2aca013d63')
b2sums=('8b6c7e64c2e958c75569aae03c9fe4c4e9d7948d5b6b2665e32deb619c641f3c860189665e91079b275e206c6ec32d6b4f336f2081f11af9454b84a78a5ff0f8')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
