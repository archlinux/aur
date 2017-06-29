# former Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=hibiscus
pkgver=2.6.20
_pkgver=2.6
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
source=("${pkgname}-${pkgver}::https://www.willuhn.de/projects/hibiscus/releases/${_pkgver}/${pkgname}.zip" "hibiscus.desktop")
sha512sums=('7488060b6317dfa16a7a8d273ee2bf18c8b2daaf2f84faf2d145915319379b168e005439380f310863d1c63fcc1e035c9e24b37714a5c94f47080bdd7311cf77'
            'ceea9cc5cf438893b2f5dfe46f46840448353f35719216ccca0b8dd12369d4e3c91d393c7c8b5b842a64537c61864ce8ca48e1895bb3f41c5083794399a21925')

package() {
  mkdir -p "$pkgdir/opt/jameica/plugins"
  cp -r "$pkgname" "$pkgdir/opt/jameica/plugins"
  install -Dm 644 "$srcdir/hibiscus.desktop" "$pkgdir/usr/share/applications/hibiscus.desktop"
}
