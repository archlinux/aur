# former Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=hibiscus
pkgver=2.8.1
_pkgver=2.8
pkgrel=1
pkgdesc="HBCI banking plugin for jameica."
arch=('x86_64' 'i686')
url="https://www.willuhn.de/projects/hibiscus/"
license=("GPL2")
depends=('java-runtime>=1.5' 'jameica>=2.2' 'libstdc++5')
makedepends=('unzip')
optdepends=('pcsclite')
options=('!strip')
install=hibiscus.install
source=("${pkgname}-${pkgver}.zip::https://www.willuhn.de/projects/hibiscus/releases/${_pkgver}/${pkgname}.zip" "hibiscus.desktop")
sha512sums=('94e12fed12a39eb4c0a7cf9541daf931b26988113a80ebaa4ae8002a2c2eefd2c9271672ac86bed2a0e447049fbdcbf35bb29c7eb427cce0a5d493f1315dacfc'
            'ceea9cc5cf438893b2f5dfe46f46840448353f35719216ccca0b8dd12369d4e3c91d393c7c8b5b842a64537c61864ce8ca48e1895bb3f41c5083794399a21925')

package() {
  mkdir -p "$pkgdir/opt/jameica/plugins"
  cp -r "$pkgname" "$pkgdir/opt/jameica/plugins"
  install -Dm 644 "$srcdir/hibiscus.desktop" "$pkgdir/usr/share/applications/hibiscus.desktop"
}
