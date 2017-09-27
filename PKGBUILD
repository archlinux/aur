# Maintainer: Ainola

pkgname=gtk-theme-ant
pkgver=2017_09_22
pkgrel=1
pkgdesc="A flat and light theme with a modern look."
arch=(any)
url="https://github.com/EliverLara/Ant"
license=('GPL3')
source=('https://dl.opendesktop.org/api/files/download/id/1506053162/Ant-Dracula.tar.xz'
        'https://dl.opendesktop.org/api/files/download/id/1506053156/Ant-Bloody.tar.xz'
        'https://dl.opendesktop.org/api/files/download/id/1506053152/Ant.tar.xz')
sha256sums=('65ebacc30d2f4060e24c7b8c4e9ac006287ea68bc0139f72fdc534439110b2d7'
            'be54f44e2b6929c73f36b61cecc04800f539abde4b28a53ccbe24584b595f848'
            '45dfa6f2e58ce43afd793dd98b3900577252659015a7d731450e1aa1a41dd8db')

package() {
  install -dm755 "$pkgdir/usr/share/themes/Ant"
  install -dm755 "$pkgdir/usr/share/themes/Ant-Bloody"
  install -dm755 "$pkgdir/usr/share/themes/Ant-Dracula"
  find "$srcdir" -name 'Gulpfile.js' -exec rm {} +
  find "$srcdir" -name 'README.md' -exec rm {} +
  find "$srcdir" -name 'package.json' -exec rm {} +
  find "$srcdir" -name 'Art' -exec rm -Rf {} +
  find "$srcdir" -name '*.sh' -exec rm {} +
  find "$srcdir" -name '*.txt' -exec rm {} +

  cp -r "$srcdir"/Ant{,-Dracula,-Bloody} "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \+
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \+
}

# vim: ts=2 sw=2 et
