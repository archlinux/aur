# Maintainer: John Jekins twodopeshaggy@gmail.com

pkgname=paintball2
pkgver=2.0.41
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
       "http://crack-gaming.de/paintball2/Paintball%202/Paintball%202.0%20Alpha%20build041/paintball2_build041_linux_full.tar.gz")
md5sums=('dd26c47f2a730d9358099dc071142088'
         '2cfe693e653e7f4080f1739076d3187c'
         'd9a362a58d5bfc6dea22302e9328dbeb'
         'd6af72ef289428d019f5f0eaa3f99818')

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
