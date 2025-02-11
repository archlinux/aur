# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sam A. Horvath-Hunt <hello@samhh.com>

_pkgname="traitor"
pkgname="${_pkgname}-bin"
pkgver=0.0.14
pkgrel=2
pkgdesc="Automatic Linux privesc via exploitation of low-hanging fruit"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/liamg/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-arm64")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_pkgname}-386")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-amd64")
sha256sums=('765a3b669ea943c44d499b61283e1a02eb5ad5a5607204368ae357f556411a18'
            '58420d88b82b14fb713a9a1725146c154b9a7edbc0f372e36e33e32ef1050547')
sha256sums_aarch64=('8c038621b5807a443d8bf7344f1df9defe0e8193a55efdda8b0e08d0923c3c9e')
sha256sums_i686=('57681a07f437b52ecf05f2b1a6f268c5d3596c9627280d3ddc2750a20b7d5dcf')
sha256sums_x86_64=('fdfbfc07248c3359d9f1f536a406d4268f01ed63a856bd6cef9dccb3cf4f2376')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
