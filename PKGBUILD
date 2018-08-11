# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Soeren Koerner <nonick at posteo dot de>
# Contributor: Benedikt 'linopolus' Mueller <benemue at googlemail dot com>

pkgname=mediathek
_realname=MediathekView
pkgver=13.1.2
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
 https://github.com/mediathekview/MediathekView/blob/$pkgver/src/main/resources/mediathek/res/MediathekView.png
        $pkgname
        $pkgname.desktop)
md5sums=('7ff4e235b41faf12c00e9c8d11bda2be'
         '30c2dcf41ab952c1c442d83ed6f4497b'
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
  install -m644 ../$_realname.png "$pkgdir"/usr/share/pixmaps/
  #install -m644 Anleitung/Kurzanleitung.pdf $pkgdir/usr/share/doc/$pkgname/
  #cp -R Copyright/* $pkgdir/usr/share/licenses/$pkgname
}
