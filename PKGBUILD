# Maintainer: trashstar <trash@ps3zone.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Tony Sokhon <tonyskn@gmail.com>
# Contributor: Ebubekir KARUL <ebubekirkarul@yandex.com>
# Contributor: Gaurish Sharma <contact@gaurishsharma.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Katrina L. Halliwell <rambaldi.kat.47@gmail.com>
# Contributor: Eugenio Ferreira <eugfcl@gmail.com>

pkgname=lighttable
pkgver=0.8.0
pkgrel=1
pkgdesc="New interactive IDE that lets you modify running programs and embed anything from websites to games."
url="http://www.lighttable.com/"
license=('MIT')
depends=("nss" "alsa-lib" "desktop-file-utils" "gconf" "libudev.so.0" "gtk2")
options=(!strip !emptydirs)
arch=('i686' 'x86_64')
install=$pkgname.install

source=(lighttable
        $pkgname-${pkgver//_/-}.tar.gz::https://github.com/LightTable/LightTable/releases/download/${pkgver//_/-}/lighttable-${pkgver//_/-}-linux.tar.gz
        lighttable.desktop
        lighttable.png
        LICENSE)
md5sums=('cad9cb77799f087aef08f0436b853412'
         'ac8484d589b8b1ff4de11a0954ef49f7'
         '04a62702b59810a36bca7623bf9e932c'
         'f8c055be2f047ff4aaffdd028f62f027'
         '8870b5e12f58e6a19a53f4fa938755e8')
PKGEXT=".pkg.tar"

package() {
  install -Dm 755 "$srcdir/lighttable" "$pkgdir/usr/bin/lighttable"

  install -dm755 "$pkgdir/usr/share/licenses/lighttable"
  install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/lighttable/LICENSE"

  _destdir="$pkgdir/opt/LightTable"

  install -dm755 $_destdir
  mv $srcdir/lighttable-${pkgver//_/-}-linux/* $_destdir

  install -Dm 644 "$srcdir/lighttable.desktop" "$pkgdir/usr/share/applications/lighttable.desktop"
  install -Dm 644 "$srcdir/lighttable.png" "$pkgdir/usr/share/pixmaps/lighttable.png"
}
