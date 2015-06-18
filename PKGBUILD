# Maintainer:
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=archlinux-lxdm-theme
pkgver=1
pkgrel=3
pkgdesc="Simple Arch Linux theme for LXDM, by Thayer Williams and Allan McRae"
arch=('any')
url="http://allanmcrae.com/2011/08/simple-arch-linux-theme-for-lxdm/"
license=("CCPL:by-sa")
depends=('lxdm')
source=(http://allanmcrae.com/files/lxdm-theme.tar.gz
        git-fixes.patch)
md5sums=('899b33309ee04f3200bb08aedb5717ed'
         '7eba1f5ca1dacbc670a05b0467004db5')

prepare() {
  patch -Np0 -i git-fixes.patch
}

package() {
  install -d "$pkgdir/usr/share/lxdm/themes/Archlinux"
  cp -dpr --no-preserve=ownership AUTHORS README TRADEMARKS gtkrc *.png greeter.ui "$pkgdir/usr/share/lxdm/themes/Archlinux"
}

# vim:set ts=2 sw=2 et:
