# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="readme-md-generator"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="A CLI that generates beautiful README.md files."
arch=('any')
url="https://www.npmjs.com/package/readme-md-generator"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!strip)
source=("https://github.com/kefranabg/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d9a950cd10c85b3e3dee7f43c2ded768a4dccdf4474ec224fe53e56cce39e55d')

# Don't extract package
noextract=('v${pkgver}.tar.gz')

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    install -dm755 "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" ${pkgname}@${pkgver}

    # License
    cd "${_npmdir}/${pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
