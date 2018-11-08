# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx
pkgver=20170424
pkgrel=5
pkgdesc="Gray variation of numix theme for Cinnamon/Gnome"
arch=('any')
url="https://www.opendesktop.org/c/1465521207"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=('gtk-theme-numix-sx-beta')

# Hash and Timestamp (taken from macos-icon-theme)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t _x <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1493077417/s/$_s/t/$_t/Numix-SX.tar.xz")
sha256sums=('7e1983924b2d90e89eddb3da8f4c43dc1326fe138fd191c8212c7904dcd618b0')

package() {
  install -d "$pkgdir/usr/share/themes"
  rm ${srcdir}/Numix-SX.tar.xz

  cp -r ${srcdir}/* "$pkgdir/usr/share/themes/"
}
