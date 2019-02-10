# Maintainer: Brandon Taylor (br dot ta dot 2818 at gmail dot com)
# Contributor: Ivan Semkin (ivan at semkin dot ru)

pkgname=electron-windows95-bin
_pkgname=windows95
pkgver=2.0.0
pkgrel=2
pkgdesc='Windows 95 in Electron. Runs on macOS, Linux, and Windows.'
arch=('amd64')
url='https://github.com/felixrieseberg/windows95'
license=('MIT')
depends=('electron')
source=("$url/releases/download/v$pkgver/windows95-linux-$pkgver_$arch.deb")
sha256sums=('7f83e6361d0606db16e77f7d1592e74a6882df53f2d98b74e0b7db3f9714353e')

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
