# Maintainer: Mikhail Velichko <efklid at gmail dot com>

pkgname=xppenlinux-v3
pkgver=3.4.9
pkgrel=231023
epoch=0
pkgdesc="XP-Pen (Official) Linux utility for legacy XPPen Tablets"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('custom')
conflicts=('xp-pen-tablet')
source=("XPPenLinux${pkgver}-${pkgrel}.tar.gz::https://www.xp-pen.com/download/file/id/1936/pid/1016/ext/gz.html")
install=${pkgname}.install

sha512sums=('3732abdb444ae6ee0ff585b8fadb750761f194936054c392a3cf0e93f59468acedff79e864f6e751aac2b398e0ba6d951b55048ffe11bcb68c5b690062adf441')


package() {
       cp -r $srcdir/XPPenLinux${pkgver}-${pkgrel}/App/* $pkgdir
       cp -r $pkgdir/lib/* $pkgdir/usr/lib
       rm -r $pkgdir/lib
       #Licence  information
       install -Dm0644 $pkgdir/usr/lib/pentablet/doc/EULA $pkgdir/usr/share/licenses/${pkgname}/LICENSE

}
