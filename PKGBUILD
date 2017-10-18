# Maintainer: Ainola

pkgname=gtk-theme-ant
pkgver=1.0.1
pkgrel=1
pkgdesc="A flat and light theme with a modern look."
arch=(any)
url="https://github.com/EliverLara/Ant"
license=('GPL3')
source=("ant-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1508040109/Ant.tar.xz'
        "ant-bloody-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1508040101/Ant-Bloody.tar.xz'
        "ant-dracula-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1508040115/Ant-Dracula.tar.xz')
sha256sums=('3bfd54f62418a3042170cba71031c6d80bb48a1a8212ca391d8151f9d7cd14e7'
            '1e7264d5d821199a8a8fa1334048bac99425d7bbd57702eeae27130c927eaf87'
            '8d1efa037fd3131bd9e93719bcbe705354982ff943c9d40ec19dcf0ce55539bf')

package() {
  install -dm755 "$pkgdir/usr/share/themes/Ant"
  install -dm755 "$pkgdir/usr/share/themes/Ant-Bloody"
  install -dm755 "$pkgdir/usr/share/themes/Ant-Dracula"

  # Remove a bunch of potential junk that was packaged
  find "$srcdir" -name 'Gulpfile.js' -exec rm {} +
  find "$srcdir" -name 'README.md' -exec rm {} +
  find "$srcdir" -name 'LICENSE' -exec rm {} +
  find "$srcdir" -name 'package.json' -exec rm {} +
  find "$srcdir" -name 'Art' -exec rm -Rf {} +
  find "$srcdir" -name '*.sh' -exec rm {} +
  find "$srcdir" -name '*.txt' -exec rm {} +
  find "$srcdir" -name 'package-lock.json' -exec rm {} +

  cp -r "$srcdir"/Ant{,-Dracula,-Bloody} "$pkgdir/usr/share/themes/"

  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \+
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \+
}

# vim: ts=2 sw=2 et
