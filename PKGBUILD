# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=vim-ingo-library
pkgver=1.044
pkgrel=1
pkgdesc="Vimscript library of common functions"
arch=("any")
url="https://github.com/inkarkat/$pkgname"
license=("custom:vim")
source=(
  "https://github.com/inkarkat/$pkgname/archive/refs/tags/$pkgver.tar.gz"
  "https://raw.githubusercontent.com/vim/vim/c9a431c7638ecebb6f2cb3eabd0e1b2b5e269c1e/runtime/doc/uganda.txt"
)
sha256sums=(
  "47f08d1fd276c7762dac99a0eae9b20323bcda860171a68e2fbdcc9804a9805f"
  "81da0f67560c8a533852fe12f33a12765c99db082247540b8231e50aa74e3cc8"
)

package() {
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"

  for dir in autoload doc; do
    cp -r "$srcdir/$pkgname-$pkgver/$dir" "$pkgdir/usr/share/vim/vimfiles"
  done

  install -Dm 644 "$srcdir/uganda.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
