# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
_pkgname="krohnkite"
pkgname="kwin-scripts-krohnkite"
pkgver=0.9.9.2
pkgrel=4
pkgdesc="A dynamic tiling extension for KWin"
url="https://codeberg.org/anametologin/krohnkite"
license=('MIT')
arch=('any')

source=("https://codeberg.org/anametologin/krohnkite/archive/$pkgver.tar.gz"
"https://codeberg.org/anametologin/Krohnkite/releases/download/$pkgver/$_pkgname.kwinscript")
sha256sums=('618a5d7b6b552026b6ed4db62422f3ec82969e989d4b5d9c816c405e4924e138'
            '42f7f66531d366c74b5fc860381da3517ccb4cdccd1f80c122fcab6e9a8fcf7e')

noextract=("$_pkgname.kwinscript")
package() {
  depends+=(
    'kwin'
  )

  install -dm755 "$pkgdir/usr/share/kwin/scripts/$_pkgname"
  bsdtar --no-same-owner -xf "$srcdir/$_pkgname.kwinscript" \
  -C "$pkgdir/usr/share/kwin/scripts/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
