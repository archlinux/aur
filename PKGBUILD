# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="envman"
pkgname="${_pkgname}-bin"
pkgver=2.5.0
pkgrel=1
pkgdesc="Manage Environment Variable collections"
arch=('x86_64' 'aarch64')
url="https://github.com/bitrise-io/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/${pkgver}/${_pkgname}-Linux-x86_64")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/${pkgver}/${_pkgname}-Linux-arm64")
sha256sums=('3006e07e1922e1714966fdb0846a327cc17ff0eac152edb5df4a3a45e2d60aca'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
sha256sums_x86_64=('943797c933f03e8e5ef1023bfd3c44ada4e92b2a7bc733822c13f3e9242f7a94')
sha256sums_aarch64=('43469402338410e8a2653819b8cf3cab599014e1b15a60b67e672cfe259e99de')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
