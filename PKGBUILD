# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=sachesi-bin
_pkgname=Sachesi
pkgver=2.0.3
pkgrel=1
pkgdesc="Firmware, extractor, searcher and installer for Blackberry 10 (official build)"
arch=('i686' 'x86_64')
url="https://github.com/xsacha/Sachesi"
makedepends=('gendesk')
license=('GPL3')
source=(https://github.com/xsacha/Sachesi/releases/download/${pkgver}/${_pkgname}${pkgver}-Linux.tar.bz2
		${_pkgname}.png::https://raw.githubusercontent.com/xsacha/Sachesi/master/assets/sachesi.png)
sha1sums=('ecd256ecfb7a7338cf666af61512b3c489d5998a'
          'f079002b6a39ea4bc71858d89b892c2d0a45c680')

package() {
  cd "${srcdir}"
  install -Dm755 Sachesi "${pkgdir}/usr/bin/Sachesi"
  # Generate desktop file
  gendesk --pkgname=${_pkgname} --pkgdesc="${pkgdesc}" -n
  install -Dm644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  rm ${_pkgname}.desktop
  install -Dm644 "${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
}
