# Maintainer: Julius Freudenberger <contact@jfreudenberger.de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name='usbimager'
_pkgname="${_name}-x11"
pkgname="${_pkgname}-bin"
pkgver=1.0.10
pkgrel=1
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

sha256sums=('7b31dd099aa020f3a0d8adb062953c6257cb1aa85de2909f4029bc867ab64532'
            '6fcb3449da17f96893b74d52bc248fd11fd0d6b0731c9f5d8e2065bbe2685e0b')
sha256sums_x86_64=('b0f748de669efb32531d23f02a50e29e23b3f08505c52b51f666b88c4c5b1ccc')
sha256sums_armv7h=('e27a35a81ea062f6b75e841aacec85e0b44accac2ca313183bb173fb2497f0f6')
sha256sums_aarch64=('40fdc91597fc25f3b94566480449358df87adf46eb822e77c0f8f6298a59936b')

package() {
  install -Dvm644 "${_name}-${pkgver}-manual" "${pkgdir}/usr/share/doc/${_name}/${_name}-manual.pdf"
  install -Dvm644 "${_name}-${pkgver}-license" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
  install -Dvm755 "bin/${_name}" -t "${pkgdir}/usr/bin"
  cp -rfv 'share' "${pkgdir}/usr"
}

# vim: ts=2 sw=2 et:
