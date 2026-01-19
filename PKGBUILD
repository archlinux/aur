# former Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=hibiscus
pkgver=2.12.2
_pkgver=2.12
pkgrel=1
pkgdesc="HBCI banking plugin for jameica."
arch=('x86_64' 'i686' 'aarch64')
url="https://www.willuhn.de/projects/hibiscus/"
license=("GPL-2.0-only")
depends=('java-runtime>=1.5' 'jameica>=2.8')
makedepends=('unzip')
optdepends=('pcsclite')
options=('!strip')
install=hibiscus.install
source=("https://willuhn.de/products/hibiscus/releases/$_pkgver/hibiscus-${pkgver}.zip"
"https://www.willuhn.de/products/hibiscus/releases/$_pkgver/hibiscus-${pkgver}.zip.asc"
"hibiscus.desktop")
validpgpkeys=("7314FBDE7D38EE5610D291B65A8ED9CFC0DB6C70") # Olaf Willuhn <info@willuhn.de>
sha512sums=('4b2d766be95f405f221fdf3aad1d4a4e09d6e5ae1c5c7aa2af6b566f6a1a7f08893bf7f81e93d9115c2bd232377db0370f5192efc07b92a2bb15bc42162e567f'
            'SKIP'
            'ceea9cc5cf438893b2f5dfe46f46840448353f35719216ccca0b8dd12369d4e3c91d393c7c8b5b842a64537c61864ce8ca48e1895bb3f41c5083794399a21925')

package() {
  mkdir -p "$pkgdir/opt/jameica/plugins"
  cp -r "$pkgname" "$pkgdir/opt/jameica/plugins"
  install -Dm 644 "$srcdir/hibiscus.desktop" "$pkgdir/usr/share/applications/hibiscus.desktop"
}
