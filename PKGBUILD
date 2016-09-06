# former Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=hibiscus
pkgver=2.6.18
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
sha512sums=('07c38fb025b4509be0fa7a94ddc2edf48704c9aec67137996e6fa9338d82b03aa0b0ba6e8d8212160350fae67948f892d7002a52f3e24cfdcaf9b601fe849bab'
            'ceea9cc5cf438893b2f5dfe46f46840448353f35719216ccca0b8dd12369d4e3c91d393c7c8b5b842a64537c61864ce8ca48e1895bb3f41c5083794399a21925')

package() {
  mkdir -p "$pkgdir/opt/jameica/plugins"
  cp -r "$pkgname" "$pkgdir/opt/jameica/plugins"
  install -Dm 644 "$srcdir/hibiscus.desktop" "$pkgdir/usr/share/applications/hibiscus.desktop"
}
