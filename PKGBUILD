# Maintainer: Julius Freudenberger <contact@jfreudenberger.de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name='usbimager'
_pkgname="${_name}-x11"
pkgname="${_pkgname}-bin"
pkgver=1.0.9
pkgrel=3
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

sha256sums=('3b155fc4d76128105783f461a1339b33cb91f366e3812b5564f4a7efd9545e92'
            '6fcb3449da17f96893b74d52bc248fd11fd0d6b0731c9f5d8e2065bbe2685e0b')
sha256sums_x86_64=('eb3607b121a0f83550182d6430aa86bc85f302295a3437153148c1abc145305f')
sha256sums_armv7h=('4c3618ebbcdb0004a9f5583cb0ff0a10cedd4409214e47dd71edd2547abf79a6')
sha256sums_aarch64=('a83688c3a7b3f478424557e0ea19d39da5f3e45e5a06d593384a34986f877ce8')

package() {
  install -Dvm644 "${_name}-${pkgver}-manual" "${pkgdir}/usr/share/doc/${_name}/${_name}-manual.pdf"
  install -Dvm644 "${_name}-${pkgver}-license" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
  install -Dvm755 "bin/${_name}" -t "${pkgdir}/usr/bin"
  cp -rfv 'share' "${pkgdir}/usr"
}

# vim: ts=2 sw=2 et:
