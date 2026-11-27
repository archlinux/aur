# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
_pkgname="krohnkite"
pkgname="kwin-scripts-krohnkite"
pkgver=0.9.11.0
pkgrel=1
pkgdesc="A dynamic tiling extension for KWin"
url="https://codeberg.org/anametologin/krohnkite"
license=('MIT')
arch=('any')

source=("https://codeberg.org/anametologin/krohnkite/archive/$pkgver.tar.gz"
"https://codeberg.org/anametologin/Krohnkite/releases/download/$pkgver/$_pkgname.kwinscript")
sha256sums=('105c062ed4fb53631e97a346923f26f3d039c4f82c98d158e8b07cc51ff41a96'
            '1a8d99bf55dbf30d3af704ba7951a895aeee1d16e7da5a7bfe1d2db8215f6fa7')

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
