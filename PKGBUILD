# Maintainer: Ainola

pkgname=gtk-theme-ant
pkgver=1.0.3
pkgrel=1
epoch=1
pkgdesc="A flat and light theme with a modern look."
arch=(any)
url="https://github.com/EliverLara/Ant"
license=('GPL3')
source=("ant-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1509163136/Ant.tar.xz'
        "ant-bloody-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1509163129/Ant-Bloody.tar.xz'
        "ant-dracula-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1509163141/Ant-Dracula.tar.xz')
sha256sums=('14b8d96d3520c9fe5a5dade35a193dca456e8a3af6dd42396d5e08f734bb48ee'
            '090f37a033228eedc447fe2ad12557b9075fd2b694f6e5e372c7743c8c5fa950'
            'f031df415bf68364a670c6f202f659c906e8da1d95875f07cd63b2b39dfed768')

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
