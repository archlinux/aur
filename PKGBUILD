# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: Dmitry Korzhevin <dkorzhevin at gmail dot com>

pkgname=sportstracker
pkgver=7.8.0
pkgrel=1
pkgdesc="Application for people who want to track their sporting activities"
arch=('x86_64')
url="http://www.saring.de/sportstracker/"
license=('GPL')
source=("sportstracker-$pkgver.deb::https://github.com/ssaring/sportstracker/releases/download/SportsTracker-$pkgver/sportstracker_$pkgver-1_amd64.deb"
        "SportsTracker.sh")
sha1sums=('e5543d1f0edc22a0389092096c9da8d13d17c1d8'
          '5005f98b1b207676881f05e016f771988bc1da6d')

package() {
  cd $pkgdir
  tar xf "$srcdir/data.tar.xz"
  chmod 755 "$pkgdir/opt"
  install -D -m644 "$pkgdir/opt/sportstracker/lib/sportstracker-SportsTracker.desktop" "$pkgdir/usr/share/applications/SportsTracker.desktop"
  install -D -m644 "$pkgdir/opt/sportstracker/lib/SportsTracker.png" "$pkgdir/usr/share/pixmaps/SportsTracker.png"
  install -D -m775 "$srcdir/SportsTracker.sh" "$pkgdir/usr/bin/SportsTracker"
}
