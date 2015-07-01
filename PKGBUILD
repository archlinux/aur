# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>
# Contributor: Kirill Gagarsky <???>

pkgname=mathsat-5
pkgver=5.2.10
pkgrel=3
pkgdesc="MathSAT 5 is an efficient SMT solver supporting a wide range of theories and functionalities"
arch=('i686' 'x86_64')
url="http://mathsat.fbk.eu/"
license=('GPL' 'LGPL' 'custom')

download_arch=$CARCH
[[ $CARCH == "i686" ]] && download_arch="x86"

source=("$pkgname-$pkgver.tar.gz::http://mathsat.fbk.eu/download.php?file=mathsat-$pkgver-linux-$download_arch.tar.gz")

md5sums=('124503e736ebb0240606fd370d6c5651')
[[ $CARCH == "i686" ]] && md5sums=('69200ea86f663d93c2d1df6c4b17655d')

options=('staticlibs')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/include/mathsat"
  mkdir -p "$pkgdir/usr/lib"

  cp -r "$srcdir/mathsat-$pkgver-linux-$download_arch/bin/." "$pkgdir/usr/bin/"
  cp -r "$srcdir/mathsat-$pkgver-linux-$download_arch/include/." "$pkgdir/usr/include/mathsat/"
  cp -r "$srcdir/mathsat-$pkgver-linux-$download_arch/lib/." "$pkgdir/usr/lib/"

  install -Dm644 "$srcdir/mathsat-$pkgver-linux-$download_arch/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
