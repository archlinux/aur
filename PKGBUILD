# Maintainer: Alice Ryhl <alice@ryhl.io>
pkgname=jspin
pkgver=5.0
pkgrel=2
pkgdesc="A java based GUI for spin."
arch=('any')
url="https://code.google.com/archive/p/jspin/"
license=('GPL2')

depends=('spin' 'java-runtime' 'bash' 'gcc' 'graphviz')

source=('https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/jspin/jspin-5-0.zip' 'config.cfg')
md5sums=('a4cd4e338a4172004a0c6b5d79cbffc5' '0235bc5375629ae9ccc17b045c724940')

package() {
  rm -rf "$pkgdir/usr/share/java/jspin"
  mkdir -p "$pkgdir/usr/share/java"
  mkdir -p "$pkgdir/usr/bin"
  rm "$srcdir/jspin-5-0.zip"
  cp -Lr "$srcdir" "$pkgdir/usr/share/java/jspin"
  printf '#!/bin/sh\nexec /usr/bin/java -jar /usr/share/java/jspin/jspin.jar "$@"\n' > "$pkgdir/usr/bin/jspin"
  chmod +x "$pkgdir/usr/bin/jspin"
}
