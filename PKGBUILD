# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Soeren Koerner <nonick at posteo dot de>
# Contributor: Benedikt 'linopolus' Mueller <benemue at googlemail dot com>

pkgname=mediathek
_realname=MediathekView
pkgver=13.2.0
pkgrel=1
pkgdesc="Offers access to the Mediathek of different german tv stations (ARD, ZDF, Arte, etc.)"
arch=('any')
url="https://mediathekview.de"
license=('GPL3')
depends=('java-openjfx')
optdepends=('mplayer: record streams'
            'flvstreamer: stream flash'
            'vlc: play files directly from mediathek')
source=(https://download.mediathekview.de/stabil/$_realname-$pkgver.tar.gz
        $pkgname
        $pkgname.desktop)
md5sums=('6d8c6635daac29c051bd2e9628f02f18'
         '461b97eecd40ec40e46b66eb219c92b9'
         'bad6e1fdc948ac0e41b8535509cf944d')

package() {
  cd $_realname-$pkgver
  install -d $pkgdir/{opt/$pkgname/{lib,bin},usr/{bin,share/{applications,pixmaps}}}
  install -m755 ../$pkgname "$pkgdir"/usr/bin/
  install -m644 $_realname.jar "$pkgdir"/opt/$pkgname/
  install -m644 -t $pkgdir/opt/$pkgname/lib lib/*
  install -m755 bin/flv.sh "$pkgdir"/opt/$pkgname/bin/
  install -m644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/
  install -m644 Icons/$_realname.svg "$pkgdir"/usr/share/pixmaps/
}
