# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.68.0
pkgrel=2
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('44585bc286dd4c4cbf1ac8ac6202e28e36a628ca50a4f76a0fbaca5c8141f0085f9659e4fb215b3f47e9fd474e1fda860138a4f122123bed309f9ce3ae16a1c6')
b2sums=('7740ce1a13af1d8104824c7fbaba57c690d04bc1953d4e703379b917d544facb522cdba1a1cffe936e4cdf6473ccfaeb7b41427cb788abf42a79fc0c5a5c121d')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
