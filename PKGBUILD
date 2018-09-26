# former Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=hibiscus
pkgver=2.8.4
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
source=("https://www.willuhn.de/products/hibiscus/releases/2.8/hibiscus-${pkgver}.zip"
"https://www.willuhn.de/products/hibiscus/releases/2.8/hibiscus-${pkgver}.zip.asc"
"hibiscus.desktop")
validpgpkeys=("7314FBDE7D38EE5610D291B65A8ED9CFC0DB6C70") # Olaf Willuhn <info@willuhn.de>
sha512sums=('df69b9a62cfcfc41467dc49f671553f2d3daceb662fa33ea3ed81a8b9c62bd8c7620b2bb9d4acf1e337c6e38a73c7c8c94adc66804c4ac6d761e093f9410669d'
            'SKIP'
            'ceea9cc5cf438893b2f5dfe46f46840448353f35719216ccca0b8dd12369d4e3c91d393c7c8b5b842a64537c61864ce8ca48e1895bb3f41c5083794399a21925')

package() {
  mkdir -p "$pkgdir/opt/jameica/plugins"
  cp -r "$pkgname" "$pkgdir/opt/jameica/plugins"
  install -Dm 644 "$srcdir/hibiscus.desktop" "$pkgdir/usr/share/applications/hibiscus.desktop"
}
