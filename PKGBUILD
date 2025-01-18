# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=VladimirMarkelov
_pkgname=solkit
pkgname=${_pkgname}-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='A solitaire collection and solitaire construction kit for terminal.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64')
license=('Apache' 'MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE"
        "LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux64-musl.tar.gz")

sha256sums=('1978dbbfa7d2527202eb1ef421a0f4c38ffc60c74e5091174a380036b2b08042'
            '12fd218920e3a29f063943bb0f5f01259ee26d38da8e0b65227291c0d91c5213'
            '5ee40f6a84da2088c1e9d752896682c94fb3bcdafd0d822ec52d3619bdf59654')
sha256sums_x86_64=('ba5d4e00ff1b1b46b1b9648b0c03a59c00333129c92bc8e4cedc268ce3847bfe')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
