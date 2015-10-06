# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>
# https://github.com/Helly1206/service.hts.pvrmanager

pkgname=kodi-addon-hts-pvrmanager
pkgbase=${pkgname}
_gitname=service.hts.pvrmanager
pkgver=1.0.6
_gitver=9393640d0d82b999a50230a31a5e8cbd73c8c406
pkgrel=1
pkgdesc='Poweroff management for current active recordings and wakeup procedures for future schedules using the XML-Interface of TVHeadend.'
arch=('any')
url="https://github.com/Helly1206/$_gitname"
license=('GPL')
groups=('kodi-addons')
depends=('kodi' 'tvheadend')
install='install'
source=("https://github.com/Helly1206/$_gitname/archive/$_gitver.tar.gz")
md5sums=('8ace938684153bc3af68f362b9499775')

package() {
  cd "$srcdir/$_gitname-$_gitver/"
  rm CHANGELOG.txt LICENSE.txt README.txt
  chmod 755 resources/lib/settimer.sh
  chmod 755 resources/lib/epggrab_ext.sh
  DESTDIR="$pkgdir/usr/share/kodi/addons/service.hts.pvrmanager"
  mkdir -p $DESTDIR
  cp -r * "$DESTDIR"
}
