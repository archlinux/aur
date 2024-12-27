# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="chromap"
pkgname="${_pkgname}-bin"
pkgver=0.2.7
pkgrel=1
pkgdesc="An ultrafast method for aligning and preprocessing high throughput chromatin profiles"
arch=('x86_64')
url="https://haowenz.github.io/chromap"
_url="https://github.com/haowenz/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgsrc}.man.1::${_url}/raw/refs/tags/v${pkgver}/${_pkgname}.1")
source_x86_64=("${_pkgsrc}-x86_64.tar.bz2::${_url}/releases/download/v${pkgver}/${_pkgsrc}_x64-linux.tar.bz2")
sha256sums=('82dfb58777e26673d1e844886c0d51b1cf491054f309fe0bd933b74406155117'
            'ecc3cb7fc6ab0fb563e0900c0960aef0e8dc0229c022013b1760baf07f85b5cf'
            'dda3f7875f7a2501ca42b73fbbecc63083c195bd64427de2df19aab14b4f343f')
sha256sums_x86_64=('371d9fbd5da507b51ab8c696f069bd94d04e27a2241980b129e54e1dedc1a567')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}.man.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
