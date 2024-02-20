# Maintainer: Julius Freudenberger <contact@jfreudenberger.de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name='usbimager'
_pkgname="${_name}-x11"
pkgname="${_pkgname}-bin"
pkgver=1.0.10
pkgrel=4
pkgdesc='Minimal GUI application to write compressed disk images to USB drives (X11 Frontend)'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://gitlab.com/bztsrc/usbimager'
license=('MIT')
depends=('hicolor-icon-theme' 'libx11')
provides=("${_name}")
conflicts=("${_name}")

# https://gitlab.com/bztsrc/usbimager/tree/binaries
source=("${_name}-${pkgver}-manual::${url}/-/raw/${pkgver}/usbimager-manual.pdf"
        "${_name}-${pkgver}-license::${url}/-/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/-/raw/binaries/${_name}_${pkgver}-x86_64-linux-x11.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/-/raw/binaries/${_name}_${pkgver}-armv7l-linux-x11.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/-/raw/binaries/${_name}_${pkgver}-aarch64-linux-x11.zip")

sha256sums=('c4797862733aa6607cdd8fba7befdd16f6be9f85f009e0250652a36d57fa57d2'
            '6fcb3449da17f96893b74d52bc248fd11fd0d6b0731c9f5d8e2065bbe2685e0b')
sha256sums_x86_64=('f92830972ca55d424baa4b9b5493524f4d2672d02454ec080c81ad54310b3241')
sha256sums_armv7h=('cea391171445cb56c53c328581377db560314149a7ad200be8950f986779dbbe')
sha256sums_aarch64=('90441b20c0054c691ea3837bd000bf91a0b6e8539e80d7298bce7991b5895873')

package() {
  install -Dvm644 "${_name}-${pkgver}-manual" "${pkgdir}/usr/share/doc/${_name}/${_name}-manual.pdf"
  install -Dvm644 "${_name}-${pkgver}-license" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
  install -Dvm755 "bin/${_name}" -t "${pkgdir}/usr/bin"
  cp -rfv 'share' "${pkgdir}/usr"
}

# vim: ts=2 sw=2 et:
