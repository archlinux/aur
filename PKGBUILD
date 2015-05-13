# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Typhoon
# Contributer: Klepto <geomoch@gmail.com>

pkgname=gate88
pkgver=Mar19_05
pkgrel=2
pkgdesc="An abstract realtime strategy/action game in space"
arch=('i686')
url="http://www.queasygames.com/gate88/"
license="custom"
groups=('games')
depends=(sdl sdl_mixer sdl_net libvorbis mesa)
source=(http://www.queasygames.com/gate88/Gate88_$pkgver.tar.gz
    gate88
    gate88.desktop
    gate88.png)
md5sums=('57b3d8432462954947b8737bbab81e91'
         'ec20608ab2f0b34625befd31aae03bcb'
         'ed2f767b002d320631952d4bf3bf2ac9'
         'c193292eea050401134ef3c83ba07a0e')


package() {
  chmod -R a+r $srcdir/Gate88_$pkgver
  chmod a+x $srcdir/Gate88_$pkgver/sound \
    $srcdir/Gate88_$pkgver/music \
    $srcdir/Gate88_$pkgver/music/non-ingame
		
  mkdir -p $pkgdir/usr/share/$pkgname/lib \
    $pkgdir/usr/share/applications \
    $pkgdir/usr/share/licenses/$pkgname \
    $pkgdir/etc/$pkgname \
    $pkgdir/etc/rc.d \
    $pkgdir/usr/bin

  cp -a $srcdir/Gate88_${pkgver}/music \
		$srcdir/Gate88_${pkgver}/sound \
		$srcdir/Gate88_${pkgver}/gate88 \
		$pkgdir/usr/share/$pkgname

  cp $srcdir/Gate88_${pkgver}/lib/libstdc++-libc6.2-2.so.3 \
    $pkgdir/usr/share/$pkgname/lib
		
  cp $srcdir/Gate88_${pkgver}/*.conf $pkgdir/etc/$pkgname
  cp $srcdir/Gate88_${pkgver}/license.txt \
    $pkgdir/usr/share/licenses/$pkgname

  cp $srcdir/$pkgname.png $pkgdir/usr/share/$pkgname
  cp $srcdir/$pkgname.desktop $pkgdir/usr/share/applications
  cp $srcdir/$pkgname $pkgdir/usr/bin
}

