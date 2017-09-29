# Maintainer: Ainola

pkgname=gtk-theme-ant
pkgver=2017_09_27
pkgrel=1
pkgdesc="A flat and light theme with a modern look."
arch=(any)
url="https://github.com/EliverLara/Ant"
license=('GPL3')
source=('https://dl.opendesktop.org/api/files/download/id/1506485271/Ant.tar.xz'
        'https://dl.opendesktop.org/api/files/download/id/1506485275/Ant-Bloody.tar.xz'
        'https://dl.opendesktop.org/api/files/download/id/1506485280/Ant-Dracula.tar.xz')
sha256sums=('76c9199262ce956f42df58040a51357ef340337b7d6d4926303eb9ec96e48208'
            'c8db624ad6d7c0e607c4a97d2e51d97d296e21bfb4ec594c34888fc27e3003e1'
            '82691d0869059a00a10c3a78b6a6da1b1fd718c80892cf24aba2c2f67f1b67d6')

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
