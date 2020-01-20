# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Rainer Suhm <automat at posteo dot de>
# Contributor: Soeren Koerner <nonick at posteo dot de>
# Contributor: Benedikt 'linopolus' Mueller <benemue at googlemail dot com>

pkgname=mediathek
_realname=MediathekView
pkgver=13.5.1
pkgrel=1
pkgdesc="Access the Mediathek of many German TV stations"
arch=('any')
url="https://mediathekview.de"
license=('GPL3')
depends=('java-runtime')
optdepends=('mplayer: record streams'
            'flvstreamer: stream flash'
            'vlc: play files directly from mediathek')
source=(https://download.mediathekview.de/stabil/$_realname-$pkgver-linux.tar.gz
        mediathekview.sh
        $pkgname.desktop)

# curl https://download.mediathekview.de/stabil/MediathekView-latest.tar.gz.SHA-512
sha512sums=('9d33ec6d8c1c1aa4227d8ffbb587dda6657f0cf970ec542a77330a92a71941ec321367ee3d6fbfe9812dc30c0830fb9214cf2947da10494b7137fa34759775ce'
            '7607dc784bbe98e729a3f5f3482cd36524cf607c0377b2f178b713a6ddf1ef900b9c414c6211c318ddf61e6e4431c359968678d2b01a3331ea24988655aab74c'
            '1a5728920704d98d7ae08d25c06c45b3dbac46ece2dc660e3a2b5806cff29263e9734cd7993d02c4c1f7710d37395da29abc094e3d786a0eaf6d130b02fcad48')

package() {
    install -d "$pkgdir"/{opt/"$pkgname",usr/{bin,share/{applications,pixmaps}}}
    install -m755 mediathekview.sh "$pkgdir/usr/bin/$pkgname"
    install -m644 "$_realname/$_realname.jar" "$pkgdir/opt/$pkgname/"
    install -m644 "$pkgname".desktop "$pkgdir"/usr/share/applications/
    install -m644 "$_realname/$_realname.svg" "$pkgdir"/usr/share/pixmaps/
}
