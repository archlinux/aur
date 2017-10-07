# Maintainer: Ainola

pkgname=gtk-theme-ant
pkgver=2017_10_03
pkgrel=1
pkgdesc="A flat and light theme with a modern look."
arch=(any)
url="https://github.com/EliverLara/Ant"
license=('GPL3')
source=("ant-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1507003574/Ant.tar.xz'
        "ant-bloody-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1507003569/Ant-Bloody.tar.xz'
        "ant-dracula-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1507003564/Ant-Dracula.tar.xz')
sha256sums=('81369505e580008a348cb7da47eb3d8e1beaa32db1c7614ce3daa2dc3c8a6543'
            '6ee3ae555ed7c650d7ae5e35ee2f5ccea506dc7116e227efb26912f425350a18'
            '9b970d1e405d47df9fe81939d83f374c18fec7a784e5a4e495e30e5da6b1372c')

package() {
  install -dm755 "$pkgdir/usr/share/themes/Ant"
  install -dm755 "$pkgdir/usr/share/themes/Ant-Bloody"
  install -dm755 "$pkgdir/usr/share/themes/Ant-Dracula"
  find "$srcdir" -name 'Gulpfile.js' -exec rm {} +
  find "$srcdir" -name 'README.md' -exec rm {} +
  find "$srcdir" -name 'LICENSE' -exec rm {} +
  find "$srcdir" -name 'package.json' -exec rm {} +
  find "$srcdir" -name 'Art' -exec rm -Rf {} +
  find "$srcdir" -name '*.sh' -exec rm {} +
  find "$srcdir" -name '*.txt' -exec rm {} +

  cp -r "$srcdir"/Ant{,-Dracula,-Bloody} "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \+
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \+
}

# vim: ts=2 sw=2 et
