# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ttf-adwaita-fonts
pkgver=48.0
pkgrel=1
pkgdesc="The typefaces for GNOME"
arch=('any')
url="https://gitlab.gnome.org/GNOME/adwaita-fonts"
license=('GPL-3.0-or-later AND OFL-1.1')
source=("https://download.gnome.org/sources/adwaita-fonts/48/adwaita-fonts-$pkgver.tar.xz")
noextract=("adwaita-fonts-$pkgver.tar.xz")
sha256sums=('1d2ef429d918e16f986aa4607bbb695135ba9c4c3e67af49da0891b2a0fb5417')

prepare() {
  mkdir -p "adwaita-fonts-$pkgver"
  bsdtar xf "adwaita-fonts-$pkgver.tar.xz" -C "adwaita-fonts-$pkgver"
}

package() {
  cd "adwaita-fonts-$pkgver"
  install -Dm644 mono/*.ttf -t "$pkgdir/usr/share/fonts/Adwaita/"
  install -Dm644 sans/*.ttf -t "$pkgdir/usr/share/fonts/Adwaita/"

  install -Dm644 mono/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-mono"
  install -Dm644 sans/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-sans"
}
