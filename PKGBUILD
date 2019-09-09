# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="readme-md-generator"
pkgver="0.6.2"
pkgrel="1"
pkgdesc="A CLI that generates beautiful README.md files."
arch=('any')
url="https://www.npmjs.com/package/readme-md-generator"
license=('MIT')
depends=('')
makedepends=('npm')
options=(!strip)
source=("https://github.com/kefranabg/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0e39837fd007de06d8b8e237926a3dc40ca2e59b83d3b83575825fbca3a18908')

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

# vim:set ts=4 sw=4 ft=sh et syn=sh:
