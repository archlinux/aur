# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=devdocs-desktop
pkgver=0.1.0
pkgrel=1
pkgdesc="DevDocs desktop application in GTK3. Multiple API documentations in a fast, organized, and searchable interface."
arch=("any")
url="https://github.com/hardpixel/devdocs-desktop"
license=("GPL")
depends=("python gtk3 webkitgtk")
provides=("devdocs-desktop")
source=("https://github.com/hardpixel/devdocs-desktop/archive/v"$pkgver".tar.gz")
md5sums=("2c728d855b6a9681f3dd77612f4197de")

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  mkdir -p "$pkgdir/usr/share/icons/gnome/128x128/apps"

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

  ln -s "/opt/$pkgname/devdocs_desktop.py" "$pkgdir/usr/bin/devdocs-desktop"
  mv "$pkgdir/opt/$pkgname/devdocs-desktop.desktop" "$pkgdir/usr/share/applications/devdocs-desktop.desktop"

  cp -a "$srcdir/$pkgname-$pkgver/icons/." "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  cp -a "$srcdir/$pkgname-$pkgver/icons/." "$pkgdir/usr/share/icons/gnome/128x128/apps"
}
