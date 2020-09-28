# Maintainer: Alice Ryhl <alice@ryhl.io>
pkgname=jspin
pkgver=5.0
pkgrel=1
pkgdesc="A java based GUI for spin."
arch=('any')
url="https://code.google.com/archive/p/jspin/"
license=('GPL2')

depends=('spin' 'java-runtime' 'bash')

source=('https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/jspin/jspin-5-0.zip')
md5sums=('a4cd4e338a4172004a0c6b5d79cbffc5')

package() {
  rm -rf "$pkgdir/usr/share/java/jspin"
  mkdir -p "$pkgdir/usr/share/java"
  mkdir -p "$pkgdir/usr/bin"
  cp -r "$srcdir" "$pkgdir/usr/share/java/jspin"
  rm "$pkgdir/usr/share/java/jspin/jspin-5-0.zip"
  printf '#!/bin/sh\nexec /usr/bin/java -jar /usr/share/java/jspin/jspin.jar "$@"\n' > "$pkgdir/usr/bin/jspin"
  chmod +x "$pkgdir/usr/bin/jspin"
}
