# Maintainer: Ivan Semkin (ivan at semkin dot ru)

pkgname=electron-windows95-bin
_pkgname=windows95
pkgver=1.2.0
pkgrel=1
pkgdesc='Windows 95 in Electron. Runs on macOS, Linux, and Windows.'
arch=('x86_64')
url='https://github.com/felixrieseberg/windows95'
license=('MIT')
depends=('electron')
source=("https://github.com/felixrieseberg/windows95/releases/download/v$pkgver/windows95-linux-$pkgver.-linux-x86_64.rpm")
sha256sums=('279732aca2e4909706ce6640a7a68cf9598b7e2527c221e09646b9de37e1b0d7')

package() { 
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/doc"
  install -d "${pkgdir}/usr/share/doc/windows95"
  install -d "${pkgdir}/usr/share/pixmaps"
  
  install -m644 "${srcdir}/usr/share/applications/windows95.desktop" "${pkgdir}/usr/share/applications/windows95.desktop"
  install -m644 "${srcdir}/usr/share/doc/windows95/copyright" "${pkgdir}/usr/share/doc/windows95/copyright"
  install -m644 "${srcdir}/usr/share/pixmaps/windows95.png" "${pkgdir}/usr/share/pixmaps/windows95.png"
  mv "${srcdir}/usr/share/windows95" "${pkgdir}/usr/share" 
  mv "${srcdir}/usr/bin/windows95" "${pkgdir}/usr/bin/windows95"
}
# vim:set ts=2 sw=2 et:
