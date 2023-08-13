# Maintainer: fenuks

pkgname=sql-formatter
pkgver=12.2.4
pkgrel=1
pkgdesc="A whitespace formatter for different query languages"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/sql-formatter-org/sql-formatter"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('744e22ecd0b92443f8e124e7f0348e7266608bcf357fdf909edea5aeb80292e9')
options=('!emptydirs')
provides=("${pkgname}")
conflicts=("${pkgname}")

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --user root --prefix "${pkgdir}"/usr --cache "${srcdir}/npm-cache" ${pkgname}@${pkgver}
}
