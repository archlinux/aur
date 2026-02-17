# Contributor: system72 <system72@waifu.club>
# Contributor: Joshua Smith <smolsheep@opensuse.org>

pkgname=iamb-bin
_pkg=iamb
pkgver=0.0.11
pkgrel=3
pkgdesc='A Matrix client for Vim addicts'
url='https://github.com/ulyssa/iamb'
arch=('x86_64')
license=('Apache-2.0')
makedepends=('git')
conflicts=('iamb')
provides=('iamb')
source=("https://github.com/ulyssa/iamb/releases/download/v${pkgver}/iamb-x86_64-unknown-linux-musl.tgz")
b2sums=('087844c33c1a5b8a44fefb5a6cb7e8caae835805d49a6465a8c209339bb81e7fb5702d6cf54550229e47225dfe872f69a3c9cc6b1664c5029b9bbc631e147f55')

package() {
    cd "${srcdir}/iamb-x86_64-unknown-linux-musl"

    install -vDm 644 -t "${pkgdir}/usr/share/licenses/${_pkg}" LICENSE

    install -vDm 644 -t "${pkgdir}/usr/share/man/man1/" docs/${_pkg}.1
    install -vDm 644 -t "${pkgdir}/usr/share/man/man5/" docs/${_pkg}.5

    install -vDm 644 -t "${pkgdir}/usr/share/doc/${_pkg}" docs/config.example.toml

    install -vDm 644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/" "docs/${_pkg}.svg"
    install -vDm 644 -t "${pkgdir}/usr/share/metainfo/" "docs/${_pkg}.metainfo.xml"
    install -vDm 644 -t "${pkgdir}/usr/share/applications/" "docs/${_pkg}.desktop"

    install -vDm 755 -t "${pkgdir}/usr/bin" "${_pkg}"
}
