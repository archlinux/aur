# Maintainer: Lucas Lazare <lazare lucas at yahoo dot fr>

pkgname=ymph
pkgver=1.0.1
pkgrel=1
pkgdesc="Youtube Music Playlist Helper - Daemonizes playlists (audio only)"
arch=('any')
url="https://github.com/Organic-Code/ymph"
license=('MIT')
depends=(
        'bash>=4'
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
md5sums=('1e8a3ca6f2585d8e34c9c1ad58c11708')

package() {
    cd "$pkgname-$pkgver"
    install -m 755 -D "$pkgname" "$pkgdir/usr/bin/${pkgname}" 
    install -m 755 -D "vlc-ctl" "$pkgdir/usr/bin/vlc-ctl" 
    install -m 755 -D "vlcd" "$pkgdir/usr/bin/vlcd" 
    install -m 644 -D "_ymph" "$pkgdir/usr/share/zsh/site-functions/_ymph"
    install -m 444 -D "LICENSE" "$pkgdir/usr/share/licenses/ymph/LICENSE"
}


