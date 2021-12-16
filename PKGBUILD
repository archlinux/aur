# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.69.1
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('a471ebf25e810c3cc721c16a7570cd188ac46ed726e0b7f47651379ee1d5be6003113fab765e5a3967a6f4968703be5cc880b26e6f288fc16186d248b79528b7')
b2sums=('f58f00a91f2040c380b927e757ca193e098c25e9d3c4714abceac327fb609aedc7cadb5d8eed02228faa87fe4e09393271f9e03c789128be49f036ded02180a1')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
