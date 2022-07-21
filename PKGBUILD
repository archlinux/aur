# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Hurstel Alexandre <alexandre at hurstel dot eu>
# Contributor: Tobias Manske <aur at rad4day dot de>

pkgname=xp-pen-tablet
pkgver=3.2.3.220323
pkgrel=7
epoch=0
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('LGPL3')
source=("XPPen-pentablet-${pkgver}-1.${arch}.deb::https://www.xp-pen.ru/download/file/id/1954/pid/143/ext/deb.html")
install=${pkgname}.install

sha512sums=('bcbd6c04ac0f28f4f9151e95ffc2e0b0941b5863e34af569964660b9aa02ea616cf24772b0a90aa69feb598aa79654a44d185048636cf84b510102c44074df6c')


package() {
       cd $srcdir
       ar x *.deb
       bsdtar xf data.tar.xz -C $pkgdir
       cp -r $pkgdir/lib/* $pkgdir/usr/lib
       rm -r $pkgdir/lib
       chmod 755 $pkgdir/usr/
       chmod 755 $pkgdir/usr/lib/
       chmod 755 $pkgdir/usr/share/
       chmod 755 $pkgdir/usr/share/applications/
       chmod 755 $pkgdir/usr/share/icons/
       #Moved from the official post_install() script to avoid errors during installation/updates
       chmod 777 $pkgdir/usr/lib/pentablet/conf/xppen/
       chmod 777 $pkgdir/usr/lib/pentablet/lib/
       chmod 777 $pkgdir/usr/lib/pentablet/platforms/
}
