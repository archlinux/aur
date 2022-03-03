# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.7.1
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('0c83e027f8db590a45d64c8085047a6f72ea8ead83c2fff8d43e5474dc8cb27bd5e5e50e126e6970201013b693f8dfeb4bc1757b3e3b89a6728bbd1eb0d7b73d')
b2sums=('04e38173b59aa1e81b7abf5ceb614755410d87bcace8634d0fa7b71cc4289b3f2119c867f1bc64b632337233952bea3b838e88041006731a08aa59d55482394c')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
