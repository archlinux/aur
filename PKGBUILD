# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=nodejs-surge
_pkgname=${pkgname#nodejs-}
_gh_user=sintaxi
pkgver=0.17.6
pkgrel=1
pkgdesc='CLI for the surge.sh CDN'
arch=('i686' 'x86_64')
url="https://github.com/${_gh_user}/${_pkgname}"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('49235786aa32e857ee55257fa72019e3a368d962e6165779047c9caa5ebacbcc')

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
