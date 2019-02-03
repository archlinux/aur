#Maintainer: Ivan Kuraj
#Contributor: Ivan Kuraj

pkgname=scala-ide
pkgver=4.7.0
pkgrel=3
pkgdesc="Scala IDE, the official IDE, stand-alone Eclipse-based version"
arch=('x86_64')
url="http://www.scala-ide.org/"
license=('custom')
source=(
  $pkgname-$pkgver.zip::"http://downloads.typesafe.com/scalaide-pack/$pkgver-vfinal-oxygen-212-20170929/scala-SDK-$pkgver-vfinal-2.12-linux.gtk.$CARCH.tar.gz"
	"LICENSE" "scala-ide.desktop" "product.png" "scala-ide.sh"
)
depends=("java-environment>=8" unzip)
optdepends=("webkit2gtk: support for internal SWT Browser") 
provides=('scala-ide')
md5sums=('2656fa91a0a89db585390e4446cd361f'
         '58b225f304aaf42c8b8738894a10cb96'
         '6a7d702fc49dd5b6895f7161ad7f0574'
         'c95b1920928f10d2c982afd7f5827a2c'
         'f9b156600b7e150f217d5061d6d16666')
sha512sums=('622f930b665b1187baaa416f3172dc6b48551148c6267fa251e1ab17cdc5c78cccce07371ce909e59af0202d7e9a0126aa9e1d22798e0498f217e7e541e0e1a8'
            '8fc7bc4f43590d477955dc2334a9489d8825b4d363d1b09f987aa93626a8ee58ec48072e1378b776937867553bc9d4aff18652d605518532efe43a8e12757a71'
            'eff6a4b1c0ff0dd134a41a32165fab5b3fbd6e33b635e36ac4af1cfe3cd156d3e13e38d28eabeec6f8589367e524bf1298d391061d0e6f791b5a06cf2fa7aea9'
            '7e3e8c874cd57f0413a84c9bfe6beff18aa442a4a74f4be0ef5d223407ddd12408f97b329a8e2ed9acad3867bfbea6c878d5d4dc3fb3592f3b05819e346e8544'
            '8b6411982fcc78674d0a9891ab356e31bfe9fa2349f72046eebb9908dfd75e7e7c3b50c1e7d99bf395eea86a1311a7ca7d19708f0c4dbd5435a469fe7ef643be')

package() {
  install -D -m0644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m0644 "$srcdir"/scala-ide.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
  install -D -m0644 "$srcdir"/product.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png

  install -d "$pkgdir/usr/lib"

  cd $srcdir
  cp -a eclipse "$pkgdir/usr/lib/${pkgname}"

  install -D scala-ide.sh "$pkgdir/usr/bin/scala-ide"
}
