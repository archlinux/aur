# Maintainer: bacteriostat <dev.bacteriostat at aleeas dot com>
# Contributor: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>

_pkgname=spotiflyer
pkgname="${_pkgname}-bin"
pkgver=3.6.2
pkgrel=3
pkgdesc="Kotlin Multiplatform Music Downloader, Supports Spotify / Gaana / Youtube Music / Jio Saavn / SoundCloud."
arch=('x86_64')
url="https://github.com/Shabinder/SpotiFlyer"
license=('GPL')
conflicts=(spotiflyer)
source=("$url/releases/download/v$pkgver/${_pkgname}_$pkgver-1_amd64.deb")
sha256sums=('e075bb84508a6ca016267cde497d9b71b6964a74321acedc1e3559aff17c3237')

package() {
    cd $srcdir
    tar -xf data.tar.xz -C $pkgdir
    install -Dm644 $pkgdir/opt/spotiflyer/lib/spotiflyer-SpotiFlyer.desktop $pkgdir/usr/share/applications/spotiflyer.desktop
    install -Dm644 $pkgdir/opt/spotiflyer/lib/SpotiFlyer.png $pkgdir/usr/share/pixmaps/spotiflyer.png
    install -d $pkgdir/usr/bin/
    ln -s /opt/spotiflyer/bin/SpotiFlyer $pkgdir/usr/bin/$_pkgname
}
