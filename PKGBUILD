# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=latencyflex-proton-ge-custom
pkgver=0.1.1
pkgrel=3
pkgdesc="LatencyFleX symlinks for proton-ge-custom (and -bin) system installation"
url="https://github.com/ishitatsuyuki/LatencyFleX"
license=('Apache-2.0')
arch=('any')
depends=('latencyflex' 'proton-ge-custom')

package() {
_steam=usr/share/steam/compatibilitytools.d/proton-ge-custom/files/lib64/wine
_lib=/usr/lib/wine/x86_64-windows/latencyflex_
# Create directories
  mkdir -p "$pkgdir/$_steam/x86_64-unix"
  mkdir -p "$pkgdir/$_steam/x86_64-windows"
# Create symlinks
  ln -s "/usr/lib/wine/x86_64-unix/latencyflex_layer.so" "$pkgdir/$_steam/x86_64-unix"
  ln -s "${_lib}layer.dll" "$pkgdir/$_steam/x86_64-windows"
  ln -s "${_lib}layer.dll.a" "$pkgdir/$_steam/x86_64-windows"
  ln -s "${_lib}wine.dll" "$pkgdir/$_steam/x86_64-windows"
  ln -s "${_lib}wine.dll.a" "$pkgdir/$_steam/x86_64-windows"
}
