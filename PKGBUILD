# former Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=hibiscus
pkgver=2.10.17
_pkgver=2.10
pkgrel=1
pkgdesc="HBCI banking plugin for jameica."
arch=('x86_64' 'i686' 'aarch64')
url="https://www.willuhn.de/projects/hibiscus/"
license=("GPL2")
depends=('java-runtime>=1.5' 'jameica>=2.8')
makedepends=('unzip')
optdepends=('pcsclite')
options=('!strip')
install=hibiscus.install
source=("https://www.willuhn.de/products/hibiscus/releases/$_pkgver/hibiscus-${pkgver}.zip"
"https://www.willuhn.de/products/hibiscus/releases/$_pkgver/hibiscus-${pkgver}.zip.asc"
"hibiscus.desktop")
validpgpkeys=("7314FBDE7D38EE5610D291B65A8ED9CFC0DB6C70") # Olaf Willuhn <info@willuhn.de>
sha512sums=('b072cc9e4c3e86b338de9dc3462dac89ba8985754d8bcab1d1f5b11d4992b32509b462069aee3dca5d403ed77fa8c00064accb15fad021c6b5f37b0cb9ed2852'
            'SKIP'
            'ceea9cc5cf438893b2f5dfe46f46840448353f35719216ccca0b8dd12369d4e3c91d393c7c8b5b842a64537c61864ce8ca48e1895bb3f41c5083794399a21925')

package() {
  mkdir -p "$pkgdir/opt/jameica/plugins"
  cp -r "$pkgname" "$pkgdir/opt/jameica/plugins"
  install -Dm 644 "$srcdir/hibiscus.desktop" "$pkgdir/usr/share/applications/hibiscus.desktop"
}
