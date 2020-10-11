# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='usbimager'
pkgname="${_pkgname}-x11-bin"
pkgver=1.0.5
pkgrel=1
pkgdesc='Minimal GUI application to write compressed disk images to USB drives (X11 Frontend)'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://gitlab.com/bztsrc/usbimager'
license=('MIT')
depends=('hicolor-icon-theme' 'libx11')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}-manual.pdf::${url}/-/raw/master/usbimager-manual.pdf"
        "${_pkgname}-${pkgver}-LICENSE::${url}/-/raw/master/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/-/raw/binaries/${_pkgname}_${pkgver}-x86_64-linux-x11.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/-/raw/binaries/${_pkgname}_${pkgver}-armv7l-linux-x11.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/-/raw/binaries/${_pkgname}_${pkgver}-aarch64-linux-x11.zip")

sha256sums=('SKIP'  # SKIP
            'SKIP') # SKIP
sha256sums_x86_64=('7494880639b3238845fa25fe7210caee649bc51a886feaa0b961075e4a40a47f')
sha256sums_armv7h=('b5048175659334c8617dd5e16c5dffe1e37cf9d26a8be3f65b7273b53ff1b8b4')
sha256sums_aarch64=('8c7f201d57de1108751fd940c9bafa5bb3705260c228de238ef6b6c4e3f4a470')

package() {
  install -Dvm644 "${_pkgname}-${pkgver}-manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}-manual.pdf"
  install -Dvm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dvm755 "bin/${_pkgname}" -t "${pkgdir}/usr/bin"
  cp -rfv 'share' "${pkgdir}/usr"
}

# vim: ts=2 sw=2 et:
