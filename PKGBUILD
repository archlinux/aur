# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='usbimager'
pkgname="${_pkgname}-bin"
pkgver=1.0.5
pkgrel=2
pkgdesc='Minimal GUI application to write compressed disk images to USB drives'
arch=('x86_64')
url='https://gitlab.com/bztsrc/usbimager'
license=('MIT')
depends=('gtk3' 'udisks2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.zip::${url}/-/raw/binaries/${_pkgname}_${pkgver}-x86_64-linux-gtk.zip"
        "${_pkgname}-${pkgver}-manual.pdf::${url}/-/raw/master/usbimager-manual.pdf"
        "${_pkgname}-${pkgver}-LICENSE::${url}/-/raw/master/LICENSE")
# NB: updpkgsums: usbimager-manual, LICENSE == SKIP
sha256sums=('36ccfa7942aeba4486cb3234e25ce04154fafbde619195926dd1dec97442d31d'
            'SKIP'
            'SKIP')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "bin/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "share/applications/${_pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps" "share/icons/hicolor/128x128/apps/${_pkgname}.png"
  install -Dm644 -t "${pkgdir}/usr/share/man/man8" "share/man/man8/${_pkgname}.8.gz"
  install -Dm644 "${_pkgname}-${pkgver}-manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}-manual.pdf"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
