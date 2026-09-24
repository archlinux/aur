# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jmelahman
_pkgname=git-orchard
pkgname=${_pkgname}-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='A command-line utility for managing git trees including worktrees and subtrees'

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('6ba5d6568d38bfa619dc0749e902262dd353164496e806281e00c8ec34cf6ab3')
sha256sums_aarch64=('edbd8fe7aadb7211976300c50787635aaab8a43bf4b2ea72e2a62fffe5289123')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
