# Maintainer: Steffen Weber <-boenki-gmx-de->
# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Soeren Koerner <nonick at posteo dot de>
# Contributor: Benedikt 'linopolus' Mueller <benemue at googlemail dot com>

pkgname=mediathek
_realname=MediathekView
pkgver=13.5.0
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
        $pkgname
        $pkgname.desktop)

# curl https://download.mediathekview.de/stabil/MediathekView-latest-linux.tar.gz.SHA-512
sha512sums=('2f4bc1c97c44830b367dbea6d2d61415b3833f5b9c759b8d863735d81201e8025f348d9103d56c703d1909caef8a8fdce9296abef2f6645c039afe713f60c2e1'
            '184ee2cd71a85d283b3f3866e652afdef9f6155ddba11e2a7de0dc7fda95f9bc3846dc7adfce6b3680da3daf75be475d746b828753ca8590e49b699006def0ee'
            '1a5728920704d98d7ae08d25c06c45b3dbac46ece2dc660e3a2b5806cff29263e9734cd7993d02c4c1f7710d37395da29abc094e3d786a0eaf6d130b02fcad48')

package() {
    cd "$_realname"
    install -d "$pkgdir"/{opt/$pkgname/bin,usr/{bin,share/{applications,pixmaps}}}
    install -m755 "$_realname" "$pkgdir"/usr/bin/"$pkgname"
    install -m644 "$_realname.jar" "$pkgdir"/opt/$pkgname/
    install -m644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/
    install -m644 $_realname.svg "$pkgdir"/usr/share/pixmaps/
}
