# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.60.3
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('62531551cd0ef596ce5c3484d7302ab9dc37af207726f4a21e9c698a58988a7d3d32b9986b6b1c2cdc7ecc13d4e36ce2873f9431d0372add4d19a6b9c90b9c26')
b2sums=('511698eed03c1acdd121da54443e87846eb4f64ea5ceb9889e47c09479679d60c91768b3fa690c7a17d23f0697595ccdaaf97f32f20730b422d7917fe3d5e962')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
