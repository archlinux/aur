# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>
# Contributor: Kirill Gagarsky <???>
# Contributor: Azat Abdullin <azat.aam@gmail.com>

pkgname=mathsat-5
pkgver=5.6.9
pkgrel=1
pkgdesc="MathSAT 5 is an efficient SMT solver supporting a wide range of theories and functionalities"
arch=('x86_64')
url="http://mathsat.fbk.eu/"
license=('GPL' 'LGPL' 'custom')

download_arch=$CARCH

source=("$pkgname-$pkgver.tar.gz::http://mathsat.fbk.eu/download.php?file=mathsat-$pkgver-linux-$download_arch.tar.gz")

md5sums=('05287ac1cda85eac244e43899ea735c6')

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
