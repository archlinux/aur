# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=meads
_execname=md
pkgname=${_pkgname}-bin
pkgver=0.40.0
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
            '93973ab673f98ce89c832d28b255034527196c08b4dd920f726cea6d72854784')
sha256sums_x86_64=('d502344f6c5a639fcb26a2568d9a7360fa852b2b1a85a216a0583eaa28b50d8c')
sha256sums_aarch64=('f8070585149276bb71133b64dcaa87d940f24699d6747b7adcf6f61a47d6abe0')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
