# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codesight
pkgver=1.14.0
pkgrel=1
pkgdesc='AI context generator - codebase mapping, token optimization, and MCP server for Claude Code, Cursor, and Codex'
arch=('any')
url='https://github.com/Houseofmvps/codesight'
license=('MIT')
depends=('nodejs')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('c1f5df5854a3eda8b840f64836b68ba2bc10038eeff47d780ea0b956c04f5f56')

package() {
    cd "${srcdir}/package"

    local _destdir="${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${_destdir}"
    cp -a dist package.json "${_destdir}/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/dist/index.js" "${pkgdir}/usr/bin/${pkgname}"
}

latestver() {
    npm view codesight dist-tags.latest
}
