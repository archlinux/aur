# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: saying <saying121@outlook.com>

pkgname=kali-themes
pkgver=2026.1.1
pkgrel=1
pkgdesc="GTK and Qt themes included with Kali Linux"
arch=('any')
url="https://gitlab.com/kalilinux/packages/kali-themes"
license=('GPL3')
options=('!strip' '!buildflags' '!makeflags')
makedepends=('optipng' 'librsvg')
source=("https://gitlab.com/kalilinux/packages/$pkgname/-/archive/kali/$pkgver/$pkgname-kali-$pkgver.tar.gz")
sha512sums=('1a379887f776f3f6055654f1d33aa4a30e8cfd37fd395aaca679c6b3c1c6d25281c383cd0176b20883516c1299e6b5f579b4f149a05d43666329fb7e1cf49230')

build() {
  cd "$pkgname-kali-$pkgver"
  make
}

package() {
  cd "$pkgname-kali-$pkgver"
  install -d -m755 "${pkgdir}/usr/share/"
  cp -r "share/themes" "$pkgdir/usr/share/themes"
  cp -r "share/icons" "$pkgdir/usr/share/icons"
  cp -r "share/qt5ct" "$pkgdir/usr/share/qt5ct"
  cp -r "share/qt6ct" "$pkgdir/usr/share/qt6ct"

  cp -r "share/color-schemes" "$pkgdir/usr/share/color-schemes"
  cp -r "share/plasma" "$pkgdir/usr/share/plasma"
  cp -r "share/plymouth" "$pkgdir/usr/share/plymouth"

  cp -r "share/gtksourceview-3.0" "$pkgdir/usr/share/gtksourceview-3.0"
  cp -r "share/gtksourceview-4" "$pkgdir/usr/share/gtksourceview-4"
  cp -r "share/gtksourceview-5" "$pkgdir/usr/share/gtksourceview-5"

  cp -r "share/qtermwidget6" "$pkgdir/usr/share/qtermwidget6"
  cp -r "share/konsole" "$pkgdir/usr/share/konsole"
}
