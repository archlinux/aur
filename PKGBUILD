# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=carafe
pkgname=${_pkgname}-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Tiny management tool for wine bottles/carafes"
arch=('x86_64')
url="https://github.com/Jelmerro/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/Jelmerro/${_pkgname}/${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('python' 'wine')

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.any.pacman")
sha512sums=('e5622d082e64e40370f02e611a9c28ece94889796bcd9ae08d401069addd45505558bc7fab4a7734b950434b9cf0a67774f42aedf66929205a86be00e8230ec3'
            'bbb21c81e7d1462a50c62bfd5a4ce2b6be31bc313cb4f1efbe0d2779c3afd9393398bbd0e04628683ec6de14deac8a26b7e9ddeb1ac927d3a14f63082805f57f')
sha512sums_x86_64=('52159c616c09abf3f402915d1aeacafa4ddacba632267cc66a91a9fbc856f8bc7a688a33481907ecc01cb2986af26fcd1d9cf5013755939aa88805696389b909')

package() {
  cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
