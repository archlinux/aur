# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.18.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('0b595c3c196fc74b528ce128907eddf8be438fc38830a3085be65158c7604dbda2b35f083c463bd248b32ac0493c4a2adb25ae505e57d1a2cc4beb38e7a07125')
b2sums=('3a2a73ac055de4e38d1405e0422f65da315351bb0b0f44c550da98ba667f128c32dafe87f160c9e92613a8dc8c54f0427219fb7fa6da8bfcd6017d3f83e299d7')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
