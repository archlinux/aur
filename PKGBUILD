# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=tube-converter
pkgver=2023.4.2
pkgrel=1
pkgdesc='An easy-to-use video downloader'
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/NickvisionApps/tubeconverter
license=(GPL3)
depends=(aria2 'dotnet-runtime>=7' ffmpeg libadwaita python-brotli python-mutagen python-pycryptodomex python-pyxattr python-websockets yt-dlp)
makedepends=(blueprint-compiler 'dotnet-sdk>=7' git just)
source=(git+$url#tag=$pkgver)
b2sums=('SKIP')

build() {
        just tubeconverter/NickvisionTubeConverter.GNOME/ publish /usr
}

package() {
        just tubeconverter/NickvisionTubeConverter.GNOME/ install "$pkgdir"
}
