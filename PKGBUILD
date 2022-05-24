# Maintainer: Maxwell Pray <synthead@gmail.com>

_pkgname=vim-SearchHighlighting
pkgname=vim-searchhighlighting
pkgver=2.10
pkgrel=1
pkgdesc="Highlighting of searches via star, auto-highlighting."
arch=("any")
url="https://github.com/inkarkat/$_pkgname"
depends=("vim-ingo-library")
license=("custom:vim")
source=(
  "https://github.com/inkarkat/$_pkgname/archive/refs/tags/$pkgver.tar.gz"
  "https://raw.githubusercontent.com/vim/vim/c9a431c7638ecebb6f2cb3eabd0e1b2b5e269c1e/runtime/doc/uganda.txt"
)
sha256sums=(
  "baf83e5baa93b1afdd28aa073229a3b120daa709d1bf28857b03c1e596e8753e"
  "81da0f67560c8a533852fe12f33a12765c99db082247540b8231e50aa74e3cc8"
)

package() {
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"

  for dir in autoload doc plugin; do
    cp -r "$srcdir/$_pkgname-$pkgver/$dir" "$pkgdir/usr/share/vim/vimfiles"
  done

  install -Dm 644 "$srcdir/uganda.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
