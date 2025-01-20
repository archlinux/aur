# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Piyush Pangtey <gokuvsvegita at gmail dot com>

_pkgauthor=isacikgoz
_pkgname=gitin
pkgname=${_pkgname}-bin
pkgver=0.2.5
pkgrel=2
pkgdesc="commit/branch/workdir explorer for git"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('BSD')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('76df719f68e63c4ab40fa7a9c738381df1de14ca70ec706120e0f4e298008ea6'
            '8660117afdb2acc992ef25f88f83646eb6d5644b2d77f89b6be8594971fc8fdf')
sha256sums_x86_64=('e768667eee5e51d8a30e53b45d4fa56f87109251b7afed15da326c91200ca417')

package() {
    install -m755 -D gitin "$pkgdir"/usr/bin/gitin

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
