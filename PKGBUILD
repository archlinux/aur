# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=svgcleaner-bin
pkgver=0.9.4
pkgrel=2
pkgdesc="SVG Cleaner CLI and the main GUI."
arch=("x86_64")
url="https://github.com/RazrFalcon/svgcleaner-gui"
license=('GPL')
provides=("svgcleaner" "svgcleaner-gui")
conflicts=("svgcleaner" "svgcleaner-git" "svgcleaner-gui" "svgcleaner-gui-git")
depends=("qt5-base" "qt5-svg")
source=("$pkgname-$pkgver::https://github.com/RazrFalcon/svgcleaner-gui/releases/download/v"$pkgver"/svgcleaner_linux_x86_64_"$pkgver".tar.gz" "svgcleaner-gui.desktop" "icons.tar.xz")
md5sums=("6b5ad19f9ebd5ffb4ddee275bd6e63b2" "8c3fa705bb99742640668a5f8ce523ca" "ced0736123ada1f0b9cd3fc25305dd5f")

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/applications"

  cp "$srcdir/7za" "$pkgdir/opt/$pkgname/7za"
  cp "$srcdir/zopfli" "$pkgdir/opt/$pkgname/zopfli"
  cp "$srcdir/svgcleaner" "$pkgdir/opt/$pkgname/svgcleaner"
  cp "$srcdir/svgcleaner-gui" "$pkgdir/opt/$pkgname/svgcleaner-gui"

  cp "$srcdir/svgcleaner-gui.desktop" "$pkgdir/usr/share/applications/svgcleaner-gui.desktop"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/hicolor"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/gnome"

  chmod +x "$pkgdir/opt/$pkgname/7za"
  chmod +x "$pkgdir/opt/$pkgname/zopfli"
  chmod +x "$pkgdir/opt/$pkgname/svgcleaner"
  chmod +x "$pkgdir/opt/$pkgname/svgcleaner-gui"

  ln -s "/opt/$pkgname/svgcleaner" "$pkgdir/usr/bin/svgcleaner"
  ln -s "/opt/$pkgname/svgcleaner-gui" "$pkgdir/usr/bin/svgcleaner-gui"
}
