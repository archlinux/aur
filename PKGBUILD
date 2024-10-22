# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="oxker"
pkgname="${_pkgname}-bin"
pkgver=0.8.0
pkgrel=1
pkgdesc="A simple TUI to view & control Docker containers"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://github.com/mrjackwills/${_pkgname}"
license=('MIT')
depends=('docker')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_aarch64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6.tar.gz")
sha256sums=('637e39273bc96b276a4976bb1f54e0e7124c7d780012addf256d8424faf55c49'
            'b73cb1c664857dc71c358b7127f3601be7d625fa97fa2d7e3b1e09381e4d98f0')
sha256sums_x86_64=('60265c62869c7c11bae4a38fcc343b4e7208d883c84c62bc093350c0387a7a34')
sha256sums_aarch64=('00c7291e71000124fd60c5aa0395b71519da3a078660f0f79e5676e073bd5962')
sha256sums_armv6h=('95f772f06b2755baaebf41d557941a3ad7294cd61baa0ac4009e12ef5b7a6dc5')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
