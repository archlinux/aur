# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=nodejs-serverless-offline
_pkgname="${pkgname#nodejs-}"
pkgver=3.8.3
pkgrel=1
pkgdesc="Emulate AWS λ and API Gateway locally when developing your Serverless project"
arch=('any')
url="https://github.com/dherault/serverless-offline"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2e5ea2c3b640c43a9f4a165fa443135b7286ddb0dbf21e4a18cbc010325b8492')

package() {
  npm \
    install \
    --user root \
    --global \
    --prefix "${pkgdir}/usr" \
    --cache "${srcdir}/npm-cache" \
    "${srcdir}/${_pkgname}-${pkgver}"
}

# vim:set ts=2 sw=2 et:
