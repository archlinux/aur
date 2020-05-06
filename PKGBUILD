# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>

pkgname=sachesi-bin
_pkgname=Sachesi
pkgver=2.0.4
pkgrel=1
pkgdesc="Firmware, extractor, searcher and installer for Blackberry 10 (official build)"
arch=('i686' 'x86_64')
url="https://github.com/xsacha/Sachesi"
makedepends=('gendesk')
license=('GPL3')
source=(https://github.com/xsacha/Sachesi/releases/download/${pkgver}/${_pkgname}${pkgver}-Linux.tar.gz
		${_pkgname}.png::https://raw.githubusercontent.com/xsacha/Sachesi/master/assets/sachesi.png)
sha512sums=('f824bfdca531191fbd84dc166557cc0c4943d521532e34fac470d60eee8f917be70ea6b42521687a3550396e3dbeeee50d454954e81956bf0fa8d900727ff722'
            '0e8f3b8f98825546b17d4141296f8dcbcd3de43ae93594a38f1dabd2978cda07b439a241c2043577297d8634d7e5d00b41a56ec7dcd4555727514f31213ef062')

package() {
  cd "${srcdir}"
  install -Dm755 Sachesi "${pkgdir}/usr/bin/Sachesi"
  # Generate desktop file
  gendesk --pkgname=${_pkgname} --pkgdesc="${pkgdesc}" -n
  install -Dm644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  rm ${_pkgname}.desktop
  install -Dm644 "${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
}
