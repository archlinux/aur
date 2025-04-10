# Maintainer: Canmi21 <9997200@qq.com>
# Contributor: Canmi (Canmi21)

pkgname="image2display-bin"
pkgver="1.1.6.2"
pkgrel=1
pkgdesc="Cross platform GUI converting images or fonts into array data."
arch=("x86_64")
url="https://github.com/chenxuuu/image2display/releases"
license=("MIT")
depends=("skia-sharp" "dotnet-runtime")
conflicts=('image2display')
source=("https://github.com/chenxuuu/image2display/releases/download/${pkgver}/Image2Display-linux-x64.tar.gz")
sha256sums=('SKIP')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib"
  tar -xzf "${srcdir}/Image2Display-linux-x64.tar.gz" -C "$srcdir"
  
  install -Dm755 "$srcdir/Image2Display" "$pkgdir/usr/bin/Image2Display"
  install -Dm644 "$srcdir/libHarfBuzzSharp.so" "$pkgdir/usr/lib/libHarfBuzzSharp.so"
  install -Dm644 "$srcdir/libSkiaSharp.so" "$pkgdir/usr/lib/libSkiaSharp.so"
}