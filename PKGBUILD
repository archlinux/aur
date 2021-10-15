# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.63.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('f11dd671e5238c505945c2f46174fafb7844588c65cf20885a2215cbdc7645fd930c10494d3bfcd93d491ef2ebf5d45505239c401bba7079734aac24d68cdb2c')
b2sums=('1ff330bced8cd4d97bc45f56989955cf070ddd51d501261ed6bef7394bc5cd1fc9b3b95dbd297820f7fc42a16c9d0f41461ebab3a82837f96b1116b919708c91')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
