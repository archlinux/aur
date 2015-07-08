# Maintainer: John Jekins twodopeshaggy@gmail.com

pkgname=paintball2
pkgver=2.0.40
pkgrel=1
pkgdesc="Fast paced fps game"
url="http://www.digitalpaint.org/"
arch=('i686' 'x86_64')
depends_i686+=(libjpeg6 sdl_ttf)
depends_x86_64+=(lib32-libjpeg6 lib32-libxt lib32-sdl_ttf lib32-alsa-lib)
license=('unknown')
install=${pkgname}.install
options=(!strip)
source=(${pkgname}.desktop ${pkgname}.png ${pkgname}.sh
       "http://sourceforge.net/projects/paintball2/files/Paintball%202/Paintball%202.0%20Alpha%20build040/paintball2_build040_linux_full.tar.gz")
md5sums=('fb44a5dc10575cccaaa134716b5365be'
         '2cfe693e653e7f4080f1739076d3187c'
         'd9a362a58d5bfc6dea22302e9328dbeb'
         '88d1acd0d126dc9c0d6b9a593347aff7')

package () {
  cd "$srcdir"
  install -m775 -g games -d "$pkgdir/opt/$pkgname/pball/"
  install -d "$pkgdir"/usr/share/doc/"$pkgname"

  
  cp -R $pkgname/ "$pkgdir/opt/"

  install -Dm 755 ${pkgname}.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 "$srcdir/paintball2.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "$srcdir/paintball2.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm 644 "$srcdir/$pkgname/README_Paintball2.txt" "$pkgdir/usr/share/doc/${pkgname}.txt"

  chown -R root:games "$pkgdir/opt/paintball2/"
  chmod g+s "$pkgdir/opt/paintball2/"
  chmod g+w "$pkgdir/opt/paintball2/"

}
