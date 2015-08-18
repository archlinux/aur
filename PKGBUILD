# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>
# https://github.com/Helly1206/service.hts.pvrmanager

pkgname=kodi-addon-hts-pvrmanager
pkgbase=${pkgname}
_gitname=service.hts.pvrmanager
pkgver=1.0.5
_gitver=48fd63361f7fbaf042f2fb620eed6ad0ecb2257b
pkgrel=2
pkgdesc='Poweroff management for current active recordings and wakeup procedures for future schedules using the XML-Interface of TVHeadend.'
arch=('any')
url="https://github.com/Helly1206/$_gitname"
license=('GPL')
groups=('kodi-addons')
depends=('kodi' 'tvheadend')
install='install'
source=("https://github.com/Helly1206/$_gitname/archive/$_gitver.tar.gz")
md5sums=('883b7674164f0cd406f63f8c627e137e')

package() {
  cd "$srcdir/$_gitname-$_gitver/"
  rm CHANGELOG.txt LICENSE.txt README.txt
  chmod 755 resources/lib/settimer.sh
  chmod 755 resources/lib/epggrab_ext.sh
  DESTDIR="$pkgdir/usr/share/kodi/addons/service.hts.pvrmanager"
  mkdir -p $DESTDIR
  cp -r * "$DESTDIR"
}
