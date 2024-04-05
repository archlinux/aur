# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: Dmitry Korzhevin <dkorzhevin at gmail dot com>

pkgname=sportstracker
pkgver=8.0.1
pkgrel=1
pkgdesc="Application for people who want to track their sporting activities"
arch=('x86_64')
url="http://www.saring.de/sportstracker/"
license=('GPL')
source=("sportstracker-$pkgver.deb::https://github.com/ssaring/sportstracker/releases/download/SportsTracker-$pkgver/sportstracker_${pkgver}_amd64.deb"
        "SportsTracker.sh")
sha1sums=('b1db8dbda50afdd128423a2cc0ec74ffaa8354c8'
          '5005f98b1b207676881f05e016f771988bc1da6d')

package() {
  cd $pkgdir
  tar axf "$srcdir/data.tar.zst"
  chmod 755 "$pkgdir/opt"
  install -D -m644 "$pkgdir/opt/sportstracker/lib/sportstracker-SportsTracker.desktop" "$pkgdir/usr/share/applications/SportsTracker.desktop"
  install -D -m644 "$pkgdir/opt/sportstracker/lib/SportsTracker.png" "$pkgdir/usr/share/pixmaps/SportsTracker.png"
  install -D -m775 "$srcdir/SportsTracker.sh" "$pkgdir/usr/bin/SportsTracker"
}
