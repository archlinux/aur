# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=fioncat
_pkgname=otree
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Object Tree TUI Viewer"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "ACTIONS-${pkgver}.md::${_urlraw}/docs/actions.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/docs/changelog.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('c7dc85e2deab624457e3f411dd0e6eb9531611c4a11e3028c38e02999f27d94d'
            '66583c2253c33a0d85031037454f84972e5f49592b1db920a5aded57ebc63a59'
            'ff847b22348070a9cbf871a2d3a7843ef43873dfc60b85bff79773cf4702faee'
            '908c1e41395bc83ea791f6507ce6ba5eff7b160ef90a8587eac41131cd4bb75c')
sha256sums_x86_64=('3821a13786dfbd0868f6f838c269864c3384d97629fe36f0f43a49dd47ec49ba')
sha256sums_aarch64=('1bdd5d74f65e1384140e8e80be100a892e6d517b8ba83b70a00eec3575af147a')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "ACTIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ACTIONS.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
