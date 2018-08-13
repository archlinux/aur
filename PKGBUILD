# Maintainer: liberodark

pkgname=strawberry-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Strawberry Music Player"
arch=('x86_64')
url="http://www.strawbs.org/"
license=('GPL')
depends=('xdg-utils' 'chromaprint' 'protobuf' 'gst-plugins-base-libs' 'boost-libs' 'qt5-base' 'qt5-x11extras' 'sqlite3' 'udisks2' 'pulseaudio' 'dbus' 'alsa-lib' 'libcdio' 'taglib')
source_x86_64=("http://builds.strawbs.net/ubuntu/bionic/strawberry_0.2.1-41-g41b0b1e_amd64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('e76d0578c7eeb51ac9a07e579ac3a2e0c030078da30559b3c5667d42950626dbdd48ef5198c5be66eaf9ae443a405a3a14744d0146300ed7593a8f4f79891623'
         '801cc7e4ab6ee590a289c28cb522b97e2b7b8bc9763edc3550f41e8d5331a07527d0bf13253ef34e5dee2f0c308a49930b30b91e5dd42810708bbd911b84fde6')
sha512sums_x86_64=('f99b9cb70d49d555e517a2a4d68acc33493647f9763dfda4b73e1310b00f1ed811d497b6c58f8b2167ea412359804702e3db8fdbe01f2f834aed73a783df4bef')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr/bin $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

