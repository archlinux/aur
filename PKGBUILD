# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.23.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('4752f741e1772866d100d419040871c307d6d55298f0c9a9e5c67026603c779b1219849cccdea5f524fed14c9f6a5f8af47b44f0c3fe8206a081a69ba2bdbc11')
b2sums=('39a604f943505536d23b8d88431ffc8f4b2b1eeae862f51ae62f4e72cdb9185b351ec9da19b778a43888c4bf5a18041a78ee4865adcb7c431dfc55ba2463a898')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
