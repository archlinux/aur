# Maintainer: liberodark

pkgname=spiral-knights
pkgver=1
pkgrel=1
pkgdesc="Join the ranks of the Spiral Knights. Stranded on an alien world, you must explore the ever-changing Clockworks beneath its surface."
arch=('x86_64')
url="http://www.spiralknights.com/"
license=('custom')
depends=('xdg-utils' 'jre8-openjdk')
source_x86_64=("https://github.com/liberodark/Spiral-Knights/releases/download/1.0.0/spiral.tar.gz")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('e23edfb55843dd5e6e507042e49f36878db5c913a662dcb3bc2e964a399c1a7b2d10620306fca33dfee526d832075dee57b7ab77b5ccbe042621556056873c5b'
         '08d5165d510755ea84ebe189803dbf66e50efd0c5b35d92b48a164f593544bce85b2852e24a41d218c733116e93994e315cafa677b8dc62d2d163a35687c52d8')
sha512sums_x86_64=('818b8f4ff61b2cbd98ffcd9962771fd383860285d31f54e6b057c3244e056ac986e930324c0e0afe924017658badfdde423062e291161b79803811ef226e832e')
        
package() {
  cd $srcdir
  tar xvf spiral.tar.gz
  mkdir -p "$pkgdir/opt/spiral/"
  cp -r "spiral/." "$pkgdir/opt/spiral/"
  chmod 667 -R "$pkgdir/opt/spiral"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
