# Maintainer: tlvince

pkgname=gtk-theme-minwaita-light-shell-unbold
pkgver=1.6
pkgrel=1
pkgdesc="Light gnome-shell theme with a normal font weights"
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
source=("Minwaita-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita.tar.gz"
        "unbold.patch")
sha256sums=('320335776b3da270b77ee6e0c395c1d61faadc509f42df7621d43be7256da1fc'
            '2233229f649a5c9a416f0805d63efcd735f9cfa79555b66d65e3a9b42fb71232')

prepare() {
  patch -p0 -i "${srcdir}/unbold.patch"
}

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -r "$srcdir"/Minwaita-Light-Shell "$pkgdir/usr/share/themes/Minwaita-Light-Shell-Unbold"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}
