# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='oneshot'
pkgname="${_pkgname}-bin"
pkgver=1.3.1
pkgrel=1
pkgdesc='Easily transfer files to and from your terminal and any browser'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/raphaelreyna/oneshot'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.linux-x86_64.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.linux-arm.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.linux-arm64.tar.gz")

sha256sums_x86_64=('dfe8ca4b99aa6bcfcb635a178710573f94c61311725e789b87485d6ed07cdfcc')
sha256sums_armv7h=('0052080354c0c830d7ed37a5a1837954f0770ae94b46e8daee8208a4f29a8cf3')
sha256sums_aarch64=('80d8a391906ca764654b64c74fb100db2b5fa9f6db3f9fa361b89a36d0a578b0')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
