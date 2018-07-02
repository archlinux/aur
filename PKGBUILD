# Maintainer: Lucas Lazare <lazare lucas at yahoo dot fr>

pkgname=ymph
pkgver=1.0
pkgrel=1
pkgdesc="Youtube Music Playlist Helper - Daemonizes playlists (audio only)"
arch=('any')
url="https://github.com/Organic-Code/ymph"
license=('MIT')
depends=(
        'bash'
        'coreutils'
        'ffmpeg'
        'grep'
        'jq'
        'procps-ng'
        'sed'
        'util-linux'
        'youtube-dl'
        'openbsd-netcat'
        'vlc'
        )
makedepends=(
        'coreutils'
)
provides=('ymph')
source=("https://github.com/Organic-Code/$pkgname/archive/$pkgver.tar.gz")
md5sums=('469b01fb964b1514aa7ade10d76b3feb')

package() {
    cd "$pkgname-$pkgver"
    install -m 755 -D "$pkgname" "$pkgdir/usr/bin/${pkgname}" 
    install -m 755 -D "vlc-ctl" "$pkgdir/usr/bin/vlc-ctl" 
    install -m 755 -D "vlcd" "$pkgdir/usr/bin/vlcd" 
    install -m 644 -D "_ymph" "$pkgdir/usr/share/zsh/site-functions/_ymph"
    install -m 444 -D "LICENSE" "$pkgdir/usr/share/licenses/ymph/LICENSE"
}


