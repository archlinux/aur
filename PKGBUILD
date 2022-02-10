# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.2.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('70002c950c312e00a47d60ff61a83d5f006730c94eb3b0dee6ddfae0b328ecec90ed53a586c4bd22a7949a0fac3139e14af7a461d0b9c6ab850bc07d34f30046')
b2sums=('85514cf8af4824fe6960f8b03c2a0a98c7f61f0f91e4549059a349906951ae9f1f75fafea8f1dc3d04e28757771b65800aba143bc8b7ffa5d30841d1e76fe935')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
