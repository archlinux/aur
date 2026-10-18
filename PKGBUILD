# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=meads
_execname=md
pkgname=${_pkgname}-bin
pkgver=0.42.0
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
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_execname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_execname}_${pkgver}_linux_${_barch[1]}.tar.gz")

sha256sums=('1a92d94f8eb94c93edd66675141c929d86b61aeab9387bbdc65ed6e7b9bb1e30'
            'c882a6fbae9034260bd78aa469c45c15188bcd3ad7e40efb30e7500ae792d490')
sha256sums_x86_64=('a01e969461f0abd9444f02a90d5b86f78f643bd32c9b7a236d747a8fc3f109b4')
sha256sums_aarch64=('d12a7f39f21c2560718eaf80f250fe61ba4c4d75daeb64dd2e77f3432c758983')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
