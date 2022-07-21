# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: DJ Ring, Jr <n1ea@arrl.net>
# Contributor: mmm
# Contributor: Woody Gilk <woody@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xaralx-bin
_pkgname=xaralx
pkgver=0.7_rev1785
pkgrel=17
pkgdesc="An advanced vector graphics program, development release"
arch=('x86_64')
url="http://www.xaraxtreme.org/"
license=('GPL')
depends=('desktop-file-utils' 'lib32-libstdc++5' 'lib32-pangox-compat' 'lib32-gtk2' 'lib32-libsm')
makedepends=('pkgconfig')
optdepends=('imagemagick: needed for some conversions'
            'java-environment: for web help')
provides=('xaralx')
conflicts=('xaralx')
install=${pkgname}.install
source=(http://downloads.xara.com/opensource/xaralx${pkgver}.tar.bz2)
sha256sums=('83de10dda870da08cc2c1285246b364e1abfe3e0eb2d8483c1aa104a74003082')

package() {
  cd "$srcdir/$_pkgname"
  install -dm 755 "$pkgdir/usr/bin" "$pkgdir/usr/share/xaralx" "$pkgdir/usr/share/licenses/xaralx"
  install -Dm 755 bin/* "$pkgdir/usr/bin"
  cp -R share/xaralx/* "$pkgdir/usr/share/xaralx"
  #chmod -R 755 "$pkgdir"/usr/share/xaralx
  install -Dm 644 share/xaralx/doc/LICENSE "$pkgdir/usr/share/licenses/xaralx/LICENSE"
  # Desktop compatibility
  install -Dm 644 $_pkgname.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  install -Dm 644 $_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install -Dm 644 $_pkgname.xml "$pkgdir"/usr/share/mime/packages/$_pkgname.xml
}
