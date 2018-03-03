# Maintainer: fenuks

pkgname=vue-language-server
pkgver=0.0.30
pkgrel=1
pkgdesc="Language server protocol implementation for Vue"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://www.npmjs.com/package/${pkgname}"
license=('MIT')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz")
noextract=(${pkgname}-$pkgver.tgz)
sha256sums=('fe3c996cfb8bb7e0e0bad9d530ad5a60202cb8c4a917519b9f7496ed6145beee')
options=('!emptydirs')
provides=('vue-language-server')

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --user root --prefix "${pkgdir}"/usr --cache "${srcdir}/npm-cache" ${pkgname}@${pkgver}
}
