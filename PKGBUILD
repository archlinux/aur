# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=sachesi
_pkgname=Sachesi
pkgver=2.0.2
pkgrel=1
pkgdesc="Firmware, extractor, searcher and installer for Blackberry 10 (official build)"
arch=('i686' 'x86_64')
url="https://github.com/xsacha/Sachesi"
makedepends=('gendesk')
license=('GPL3')
source=(https://github.com/xsacha/Sachesi/releases/download/${pkgver}/${pkgname}${pkgver}-Linux.tar.bz2
		https://raw.githubusercontent.com/xsacha/Sachesi/master/assets/sachesi.png)
sha1sums=('2ecf4043b384fdbbc4dda27db03b6e30f83e9818'
          'f079002b6a39ea4bc71858d89b892c2d0a45c680')

package() {
  cd "${srcdir}"
  install -Dm755 Sachesi "${pkgdir}/usr/bin/Sachesi"
  # Generate desktop file
  gendesk --pkgname=${_pkgname} --pkgdesc="${pkgdesc}" -n
  install -Dm644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  rm ${_pkgname}.desktop
  install -Dm644 "${pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
}
