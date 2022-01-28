# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.0.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('205bd19cf476e6e6f1fdef106cde78793a33c6aad4ff5650323c9a733e261007d3a68bcbded1965da7a8815c9ffcca7b8c822bd8f4f798c91fc9c3d28915fc78')
b2sums=('1202ecee96a15b86853b3498bca65ccfd157b5a806fd330daaa64d2064f16c03601dd11ede7efbc972d77efd8466129264b291bc805a64a51a4a93b81f12bf52')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
