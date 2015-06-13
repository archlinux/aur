# Typhoon PKGBUILD
# Contributer: Klepto <geomoch@gmail.com>
# Redone, updated and  maintained by McLenin <mclenin at gooogles email>

pkgname=typhoon_2001
pkgver=r3992
pkgrel=4
pkgdesc="A fast paced 3D shoot-em-up based on Tempest 2000"
arch=("i686" "x86_64")
url="http://www.kuto.de/projekte_typhoon.html"
license="unknown freeware"
options=(!strip)
install=typhoon_2001.install
depends_i686+=("flac" "glu" "libpulse" "libvorbis" "libxcursor" "libxpm" "libxrender" "mesa")
depends_x86_64+=("lib32-flac" "lib32-glu" "lib32-libpulse" "lib32-libvorbis" "lib32-libxcursor" "lib32-libxpm" "lib32-libxrender" "lib32-mesa" )
source=("https://dl.dropboxusercontent.com/u/13181650/typhoon_2001_r3992.tar.gz" "https://dl.dropboxusercontent.com/u/13181650/typhoon_add.tar.gz")
md5sums=('d83d89570a18ef121776442baef00647'
         'b02d2ea8fcfed6f065cf1837723c03da')

package() {
        install -dm777 "$pkgdir"/usr/share/$pkgname        
        install -d "$pkgdir"{/usr/share/$pkgname/game/,/usr/share/applications/,/usr/bin/}
        cp -r  $srcdir/game/*         $pkgdir/usr/share/$pkgname/game/
        install -m644 $srcdir/*.mod  $pkgdir/usr/share/$pkgname/
        install -m644 $srcdir/*.dat  $pkgdir/usr/share/$pkgname/
        install -m644 $srcdir/*.txt  $pkgdir/usr/share/$pkgname/

        chmod a+x $srcdir/typhoon
        ls -all  $srcdir/typhoon
        cp  -a $srcdir/typhoon $pkgdir/usr/share/$pkgname/typhoon

       # md5sum $pkgdir/usr/share/$pkgname/typhoon       

	install -Dm644   $srcdir/$pkgname.png         $pkgdir/usr/share/$pkgname/
	install -Dm644   $srcdir/$pkgname.desktop      $pkgdir/usr/share/applications/
	install -Dm755   $srcdir/$pkgname              $pkgdir/usr/bin/
}
