# Maintainer: tlvince

pkgname=gtk-theme-minwaita-light-shell-unbold
pkgver=1.4
pkgrel=1
pkgdesc="Light gnome-shell theme with a normal font weights"
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
source=("Minwaita-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita.tar.gz"
        "unbold.patch")
sha256sums=('c004d672cd5ee34f3a5e1580b5347005a16f7d623e8fb35e05a784a99ab5b78e'
            'b9c3d3a8e705e99d40dc2cbda63b57eec127d77703ad0666a9428678efa6b5bb')

prepare() {
  patch -p0 -i "${srcdir}/unbold.patch"
}

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -r "$srcdir"/Minwaita-Light-Shell "$pkgdir/usr/share/themes/Minwaita-Light-Shell-Unbold"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}
