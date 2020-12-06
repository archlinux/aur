# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=devdocs-desktop
pkgver=1.2.0
pkgrel=1
pkgdesc="DevDocs GTK3 application for multiple API documentations in a fast searchable interface"
arch=("any")
url="https://github.com/hardpixel/devdocs-desktop"
license=("GPL")
depends=("python" "python-gobject" "python-dbus" "webkit2gtk")
provides=("devdocs-desktop")
source=("$pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
md5sums=("258c1fb85f25b2a1198d6bd71711a0c5")

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/icons/gnome"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/$pkgname-$pkgver/icons/hicolor/." "$pkgdir/usr/share/icons/hicolor"
  cp -a "$srcdir/$pkgname-$pkgver/icons/hicolor/." "$pkgdir/usr/share/icons/gnome"

  ln -s "/opt/$pkgname/devdocs_desktop.py" "$pkgdir/usr/bin/devdocs-desktop"
  mv "$pkgdir/opt/$pkgname/devdocs-desktop.desktop" "$pkgdir/usr/share/applications/devdocs-desktop.desktop"
}
