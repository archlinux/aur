# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.10.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('d9b469a8916b7a394dd2122b4e7150295fcc7a3505f2565245f50b06a7541b87a6c2b5224f36527ab61d51589f1ef86f204727a3a19e4db32cd71c10ac26f67f')
b2sums=('1bb73d87e1669a87bab383047b975e59290d6e5c70e6937ab1d883595e8c5e9b2a59c6d62bef50fc072418a01fe6f62ec9d2617740158689a27622924126f8ab')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
