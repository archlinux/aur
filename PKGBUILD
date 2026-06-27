# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codesight
pkgver=1.16.0
pkgrel=1
pkgdesc='AI context generator - codebase mapping, token optimization, and MCP server for Claude Code, Cursor, and Codex'
arch=('any')
url='https://github.com/Houseofmvps/codesight'
license=('MIT')
depends=('nodejs')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('25f9b51cb3e5062d41c5e4291b1a8dbe2974635fdb29223013f53d489d7ab8d1')

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
