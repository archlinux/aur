# Maintainer: Julius Freudenberger <contact@jfreudenberger.de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name='usbimager'
_pkgname="${_name}-x11"
pkgname="${_pkgname}-bin"
pkgver=1.0.8
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

sha256sums=('8bc3fefad7ed60af740cade94aba20803865cf648e693f826b889742126a15c3'
            '6fcb3449da17f96893b74d52bc248fd11fd0d6b0731c9f5d8e2065bbe2685e0b')
sha256sums_x86_64=('954dc053d9ed31ad02ce7dc0b681858aa6b23eaed661c1d1eb75ccc65b3f6016')
sha256sums_armv7h=('d4e241abb5aeb8e19afae1ac516965b9d9363cb77d16961a7e659e1ff7c16496')
sha256sums_aarch64=('6cf03a1af98d188ed47d909fef62f0181117630badb2712e5af75b0c4271f92a')

package() {
  install -Dvm644 "${_name}-${pkgver}-manual" "${pkgdir}/usr/share/doc/${_name}/${_name}-manual.pdf"
  install -Dvm644 "${_name}-${pkgver}-license" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
  install -Dvm755 "bin/${_name}" -t "${pkgdir}/usr/bin"
  cp -rfv 'share' "${pkgdir}/usr"
}

# vim: ts=2 sw=2 et:
