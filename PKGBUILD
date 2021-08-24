# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.55.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('3c528fc49bddc2ba3b0e0175ff45a6006af22428fa0c8a32078e01f81d46e92c6aabfc976778fca5c71b508187b4060d245a7492bed4d72f2c1f1700b81c3991')
b2sums=('d2d5f49c15039c0a785733336777d0e94b900f7b4c42bc859356c2d7b5bbbff48c246c1fb62aa13dd8560fc4abda403716726f1e1f1a004afcf7b1b47d0bd165')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
