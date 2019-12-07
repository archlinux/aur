# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
# Contributor: Boudhayan Gupta <bgupta@kde.org>

_npmname=netlify-cli
_npmver=2.24.0

pkgname=netlify
pkgver=${_npmver}
pkgrel=1
pkgdesc="Create, deploy, and delete new sites hosted on Netlify straight from your terminal"

arch=(any)
url="https://www.netlify.com/docs/cli/"
license=(MIT)
depends=("nodejs" "npm")
optdepends=()
source=(https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz)
noextract=(${_npmname}-${_npmver}.tgz)
sha256sums=('3e8e49989ca275bb9ae55e7cfefc17bc7f60d6be9c8e412cf1d480d717c44b15')

package() {
    cd ${srcdir}
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p ${_npmdir}
    cd ${_npmdir}
    npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}
