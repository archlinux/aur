# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="diagon"
pkgname="${_pkgname}-bin"
pkgver=1.1.158
pkgrel=1
pkgdesc="Cli text diagram generator"
arch=('x86_64')
url="https://github.com/ArthurSonzogni/Diagon"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-1.1.156-Linux.tar.gz")
sha256sums=('936a20adf981532c1d0ce3bd0b97db41966a8d1e3bec0c4195d614684cd1323f'
            'a8f8105ef36e4bbdccaf64d588891fdcd971635cf965e45beef84bbb0b4c9d9e')
sha256sums_x86_64=('7b61001d863f60bfb0e2885b293126ae4cd7710f01d5a334b48d7b957f006d00')

package() {
  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgname}-1.1.156-Linux/bin"
  install -Dm755 "${_pkgname}-1.1.156" "${pkgdir}/usr/bin/${_pkgname}"
}
