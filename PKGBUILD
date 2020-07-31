# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=usbimager
pkgname=${_pkgname}-bin
pkgver=1.0.4
pkgrel=1
pkgdesc='Minimal GUI application to write compressed disk images to USB drives'
arch=('x86_64')
url='https://gitlab.com/bztsrc/usbimager'
license=('MIT')
depends=('gtk3' 'udisks2')
source=("${_pkgname}-${pkgver}.zip::${url}/-/raw/binaries/${_pkgname}_${pkgver}-x86_64-linux-gtk.zip"
        "${_pkgname}-${pkgver}-manual.pdf::${url}/-/raw/master/usbimager-manual.pdf"
        "${_pkgname}-${pkgver}-LICENSE::${url}/-/raw/master/LICENSE")
sha256sums=('49a11062ac722236c2f265358b96ffaad803e530ff5c7192e68d329564f8ba66'
            'SKIP'
            'SKIP')

package() {
  install -Dm644 "${_pkgname}-${pkgver}-manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/manual.pdf"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "share/man/man8/${_pkgname}.8.gz" "${pkgdir}/usr/share/man/man8/${_pkgname}.8.gz"
  cp -r 'share/icons' "${pkgdir}/usr/share"
}

# vim: ts=2 sw=2 et:
