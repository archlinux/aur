# Maintainer: onurmercury <onurmercury at proton dot me>

# Releases and details about the project can be found at:
# https://github.com/Stremio/stremio-service
#
# Check new releases:
# curl -sf https://api.github.com/repos/Stremio/stremio-service/releases | grep -om1 '"tag_name": *"[^"]*"' | awk -F'"' '{print $4}'

_debname=stremio-service

pkgname="$_debname-bin"
pkgver=0.1.15
pkgrel=1
pkgdesc="The companion app of Stremio Web"
arch=('x86_64')
url="https://github.com/Stremio/stremio-service"
license=('GPL-2.0')
depends=('cairo'
         'gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gtk3'
         'libayatana-appindicator')
conflicts=("$_debname")
provides=("$_debname")
source=("${_debname}_v${pkgver}-${arch}.deb::https://github.com/Stremio/stremio-service/releases/download/v${pkgver}/${_debname}_amd64.deb")
sha512sums=('f37b790ecc365f968fd8be3db7bb2a3782799d84d26c2ee710736e0bae4c6cfc1fd9e96a1f275bc683a35a46fc07b10382ab66aa1d5563fa35d8e792fb0d017b')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  # Remove Debian specific documents
  rm -rf "$pkgdir/usr/share/doc/"
}
