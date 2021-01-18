# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>

pkgname=twitch-downloader-bin
pkgver=1.39.2
pkgrel=1
pkgdesc="Twitch VOD/Clip Downloader - Chat Download/Render/Replay"
makedepends=("unzip")
arch=("x86_64")
url="https://github.com/lay295/TwitchDownloader"
license=("MIT")
source=("https://github.com/lay295/TwitchDownloader/releases/download/${pkgver}/TwitchDownloaderCLI-Linux-x64.zip")
sha512sums=('962d705b15c607a294b91a432b6565f51e8ba789955b19f484395ba1ca07b9adf617ae193f17ce5f7d477b8b8490f6297b889db8fd8cec7159bc8c9dc937fc77')
options=(!strip)

prepare() {
    cd "$srcdir"
    unzip -o TwitchDownloaderCLI-Linux-x64.zip
}

package() {
    install -Dm755 "$srcdir/TwitchDownloaderCLI" "$pkgdir/usr/bin/TwitchDownloaderCLI"
}
