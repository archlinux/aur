# Maintainer: icasdri <icasdri at gmail dot com>

_npmname=create-react-app
pkgname="nodejs-${_npmname}"
pkgver=1.3.3
pkgrel=1
pkgdesc="Create React apps with no build configuration"
arch=(any)
url="https://www.npmjs.com/package/${_npmname}"
license=('BSD')
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=(${_npmname}-${pkgver}.tgz)
sha384sums=('837803e95d68568ec7dce96f446efd701d9721ab82040ccd0d6e7f930b8ad15f5c82fa5edbcff1184bf83b8762b38ca6')

package() {
    cd "$srcdir"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}
