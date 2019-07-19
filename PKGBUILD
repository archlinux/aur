# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: Dmitry Korzhevin <dkorzhevin at gmail dot com>

pkgname=sportstracker
pkgver=7.7.0
pkgrel=1
pkgdesc="Application for people who want to track their sporting activities"
arch=('any')
url="http://www.saring.de/sportstracker/"
license=('GPL')
source=(sportstracker-$pkgver.deb::https://sourceforge.net/projects/sportstracker/files/SportsTracker/SportsTracker%20$pkgver/Ubuntu/sportstracker-$pkgver.deb/download
        SportsTracker.sh)
sha1sums=('3d441e4e6f131560d0727463b660f3d73ec68dd8'
          'a4a76ec5366656463489fb37f0725a0692b6c2d5')

package() {
  cd $pkgdir
  tar xf "$srcdir/data.tar.xz"
  chmod 755 "$pkgdir/opt"
  install -D -m644 "$pkgdir/opt/SportsTracker/SportsTracker.desktop" "$pkgdir/usr/share/applications/SportsTracker.desktop"
  install -D -m644 "$pkgdir/opt/SportsTracker/SportsTracker.png" "$pkgdir/usr/share/pixmaps/SportsTracker.png"
  install -D -m775 "$srcdir/SportsTracker.sh" "$pkgdir/usr/bin/SportsTracker"
}
