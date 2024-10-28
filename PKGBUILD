# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=fioncat
_pkgname=otree
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Object Tree TUI Viewer"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "ACTIONS-${pkgver}.md::${_urlraw}/docs/actions.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/docs/changelog.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-musl.tar.gz")
sha256sums=('c7dc85e2deab624457e3f411dd0e6eb9531611c4a11e3028c38e02999f27d94d'
            'e64ed7d853bd8ceb793714c976af3f185b30b52db0337bfd2bb6f1452dfd5311'
            'ff847b22348070a9cbf871a2d3a7843ef43873dfc60b85bff79773cf4702faee'
            '04fe2923102965ce3cdf4bc5a29a676db82e5b915569069d0dc3860ae0c3888d')
sha256sums_x86_64=('b2be6e4b0cc988cb70ac03c9814e5d45c170f7d306ab85b964f7d5574a394b47')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "ACTIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ACTIONS.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
