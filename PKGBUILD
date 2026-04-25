# Maintainer: C-Yassin <c.yassin.org@gmail.com>
pkgname=flameget
pkgver=1.0
pkgrel=1
pkgdesc="A GTK4 Download Manager wrapping Aria2, Curl, and YT-DLP"
arch=('any')
url="https://github.com/C-Yassin/FlameGet"
license=('MIT' 'LGPL3')
depends=('python' 'python-gobject' 'python-flask' 'gtk4' 'libappindicator-gtk3'
         'aria2' 'python-pycurl' 'yt-dlp' 'python-requests' 'python-waitress'
         'aria2p' 'ffmpeg')
makedepends=('git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('92ea587e37b7286c65b9d8a1f9bebfc4b848010af998d45cfd9a27243972617e')

package() {
    cd "FlameGet-$pkgver"

    install -d "$pkgdir/usr/lib/$pkgname/icons"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -d "$pkgdir/usr/share/metainfo"

    install -m644 *.py *.json *.css -t "$pkgdir/usr/lib/$pkgname/"

    install -m644 icons/xsi-*.svg -t "$pkgdir/usr/lib/$pkgname/icons/"

    install -m644 flameget.desktop -t "$pkgdir/usr/share/applications/"
    install -m644 flameget.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    #later install -m644 *.metainfo.xml -t "$pkgdir/usr/share/metainfo/"

    install -m755 flameget.sh "$pkgdir/usr/bin/flameget"
}
