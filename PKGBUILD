# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=x-docs-pdf
pkgver=20140422
pkgrel=2
pkgdesc="X documentation"
arch=(any)
url="http://www.x.org/docs/"
license=('custom')
options=(docs)
depends=('wget')
source=('mirror.pl')
sha512sums=('16f13158b371140ad00a15d8fe87c088277641dc2508b06e9595b611a40bd665c6e5bd7f21b19c5a906a8fec2febf309a59a29313db8427a7219de424a5ddb1b')

package() {
  mkdir -p "$pkgdir"/usr/share/doc/X11 "$pkgdir"/usr/share/licenses/x-docs-pdf "$srcdir"/X11
  cd "$srcdir"/X11
  perl "$srcdir"/mirror.pl
  cp -r "$srcdir"/X11 "$pkgdir"//usr/share/doc/
  cat <<EOF >"$pkgdir"/usr/share/licenses/x-docs-pdf/COPYRIGHT
  See PDF's first pages for copyright notes.
EOF
}
