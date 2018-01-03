# Maintainer: Boudhayan Gupta <bgupta@kde.org>

_npmname=netlify-cli
_npmver=1.2.2

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
sha256sums=("725384cc05083be11bb4def3a5e670b8c8a54f3bf694ceecb31732a7c625d258")

package() {
    cd ${srcdir}
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p ${_npmdir}
    cd ${_npmdir}
    npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}
