# Maintainer: Brandon Taylor (br dot ta dot 2818 at gmail dot com)
# Contributor: Ivan Semkin (ivan at semkin dot ru)

pkgname=electron-windows95-bin
_pkgname=windows95
pkgver=2.0.0
pkgrel=2
pkgdesc='Windows 95 in Electron. Runs on macOS, Linux, and Windows.'
arch=('x86_64')
url='https://github.com/felixrieseberg/windows95'
license=('MIT')
depends=('electron')
source=("https://github.com/felixrieseberg/windows95/releases/download/v$pkgver/windows95-linux-$pkgver.x86_64.rpm")
sha256sums=('15d498ada7edc3a6f7b60fa3243b7e4ea385221e22a7f148856e27e941134ab3')

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
