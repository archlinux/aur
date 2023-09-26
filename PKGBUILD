# Maintainer : exkc <exxxxkc@getgoogleoff.me> 
# Fork from icecat-bin

pkgname=icecat-bin
_pkgname=icecat
pkgver=102.10.0
_pkgver=${pkgver}-gnu1
pkgrel=0
pkgdesc="Rpm Binary build (from fedora) of the GNU version of the Mozilla Firefox browser"
arch=('i686' 'x86_64' 'aarch64')
url="http://www.gnu.org/software/gnuzilla/"
license=('GPL' 'MPL' 'LGPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite' 'pango' 'freetype2' 'libxft' 'libx11')
makedepends=()
provides=('icecat' )
conflicts=('icecat')
replaces=('icecat')
source_aarch64=(https://kojipkgs.fedoraproject.org//packages/icecat/102.10.0/1.rh1.fc38/aarch64/icecat-102.10.0-1.rh1.fc38.aarch64.rpm)
source_x86_64=(https://kojipkgs.fedoraproject.org//packages/icecat/102.10.0/1.rh1.fc38/x86_64/icecat-102.10.0-1.rh1.fc38.x86_64.rpm)
source_i686=(https://kojipkgs.fedoraproject.org//packages/icecat/102.10.0/1.rh1.fc38/i686/icecat-102.10.0-1.rh1.fc38.i686.rpm)
source=($_pkgname.desktop
	$_pkgname-safe.desktop
	$_pkgname-launcher.sh)

sha256sums=('c44eab35f71dd3028a74632463710d674b2e8a0682e5e887535e3233a3b7bbb3'
            '190577ad917bccfc89a9bcafbc331521f551b6f54e190bb6216eada48dcb1303'
            'b49fe5ba063002ad2cbf5e981b98d08e4157e20f5a4f00971a5f73eeca6ddbba')
sha256sums_aarch64=('bda415faa9dff93aa62c11b92a30d0d6eb23664c116078489aaa571fd6a71f79')
sha256sums_i686=('20c0892a84d60bba09acb2c7d3f5fc0321a28c9316ffad781b1da8e455c92f06')
sha256sums_x86_64=('a237d45918ce55ebe3f3152927392244ee3fb19479df7c9bfb3c6e86fe724bbc')


package() {
install -d $pkgdir/usr/lib/$_pkgname
if [ -d $srcdir/usr/lib64/ ] 

then 

  cp -a $srcdir/usr/lib64/$_pkgname/* $pkgdir/usr/lib/$_pkgname/
else 
  cp -a $srcdir/usr/lib/$_pkgname/* $pkgdir/usr/lib/$_pkgname/
fi
  install -d $pkgdir/usr/share/applications
  install -m644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications
  install -m644 $srcdir/$_pkgname-safe.desktop $pkgdir/usr/share/applications
  install -d $pkgdir/usr/share/icons/hicolor/
  install -dm644 $srcdir/usr/share/icons/hicolor/* $pkgdir/usr/share/icons
  install -d $pkgdir/usr/bin/
  install -m755 $srcdir/$_pkgname-launcher.sh $pkgdir/usr/bin/$_pkgname
}

