# Collaborator: icasdri <icasdri at gmail dot com>
# Maintainer: knight42 <anonymousknight96 at gmail dot com>

_npmname=create-react-app
pkgname="nodejs-${_npmname}"
pkgver=1.4.0
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
sha384sums=('8ce34a691e15eebf21771b313e67b5a149eb440e86106e21d07b6ba830520a04176b7bcea3b16b91439415f8d4d8a1f3')

package() {
    cd "$srcdir"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}
