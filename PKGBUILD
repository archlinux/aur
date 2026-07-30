# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=meads
_execname=md
pkgname=${_pkgname}-bin
pkgver=0.37.0
pkgrel=1
pkgdesc='Task tracking in a single file — just TASKS.md and git'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
license=('MIT')

conflicts=("${_pkgname}")
provides=("${_execname}")

options=('!strip')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_execname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_execname}_${pkgver}_linux_${_barch[1]}.tar.gz")

sha256sums=('1a92d94f8eb94c93edd66675141c929d86b61aeab9387bbdc65ed6e7b9bb1e30'
            'a3860be622a81b4c8ad5e479700e6c3899698ded2f164e6b82c5f48bca095431')
sha256sums_x86_64=('7de4337263df053087d5313ad1a1b737cf5454482127def70dbd062a6163b553')
sha256sums_aarch64=('f957a22219a69eff2bdc7d5188227cd31c12564c1ac1b0fb737c65acc8f0c06f')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
