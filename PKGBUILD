# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=nodejs-serverless-git
_pkgname=serverless
pkgver=1.6.1.36.g88c9dc88
pkgrel=1
pkgdesc="Serverless Framework - Build web, mobile and IoT applications with serverless architectures using AWS Lambda, Azure Functions, Google CloudFunctions & more"
arch=('any')
url="https://serverless.com"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=(nodejs-serverless)
conflicts=(nodejs-serverless)
source=("git+https://github.com/${_pkgname}/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver="$(git describe --tags)"
  ver="${ver/v/}"
  printf "%s" "${ver//-/.}"
}

package() {
  npm \
    install \
    --user root \
    --global \
    --prefix "${pkgdir}/usr" \
    --cache "${srcdir}/npm-cache" \
    "${srcdir}/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
