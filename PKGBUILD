# former Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=hibiscus
pkgver=2.10.15
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
sha512sums=('7b5127f4b504c7f8c32b6f89fc27e6eee69fc955b43d066ee25c17d27d9d2857c57021a020783e4992573ec04a80c4cb4fb5470104402fc127b538e92f397eae'
            'SKIP'
            'ceea9cc5cf438893b2f5dfe46f46840448353f35719216ccca0b8dd12369d4e3c91d393c7c8b5b842a64537c61864ce8ca48e1895bb3f41c5083794399a21925')

package() {
  mkdir -p "$pkgdir/opt/jameica/plugins"
  cp -r "$pkgname" "$pkgdir/opt/jameica/plugins"
  install -Dm 644 "$srcdir/hibiscus.desktop" "$pkgdir/usr/share/applications/hibiscus.desktop"
}
