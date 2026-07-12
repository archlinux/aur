# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=meads
_execname=md
pkgname=${_pkgname}-bin
pkgver=0.34.0
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
            'a69c9d6978194fa0bfead9c623b487ca45328282205be6767999529d47c04d37')
sha256sums_x86_64=('f3ae6f8c6fb7c4d45300a17c4f98f1ea1bd177aad09c7c23ace0903c8ee9deca')
sha256sums_aarch64=('41e67590bb52464a72c151a19fec88e9a53e06abdbf6ac440c71f44dc7515e8d')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
