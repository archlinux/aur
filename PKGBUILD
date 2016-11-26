# Maintainer: Hans-Nikolai Viessmann <hv15 @ hw.ac.uk>
_pkgname=cmgui
pkgname="bright-${_pkgname}"
pkgver=7.3
pkgrel=1
pkgdesc="Bright Clusters Management GUI application"
arch=('x86_64')
url="http://www.brightcomputing.com/documentation"
license=('unknown')
depends=('firefox')
source=("http://support.brightcomputing.com/cmgui-download/${_pkgname}-${pkgver}.tar.bz2"
        'cmgui.sh')
md5sums=('f8819cea30e1e160b1af6c86ce6329d9'
         '005a904d7c43fdab0df2048766a00cf1')
noextract=("${_pkgname}-${pkgver}.tar.bz2")

package() {
  cd "$pkgdir"

  install -d "$pkgdir/opt/BrightCMGUI"
  install -Dm755 "$srcdir/cmgui.sh" "$pkgdir/etc/profile.d/cmgui.sh" 
  
  msg2 "Extracting archive"
  bsdtar --strip-components 1 -xjf "$srcdir/${_pkgname}-${pkgver}.tar.bz2" -C "$pkgdir/opt/BrightCMGUI"
}

# vim: ts=2 sw=2 et:
