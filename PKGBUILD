# Maintainer: sinder <smirnov.sinder@gmail.com>
pkgname=live-paper-bin
_pkgname=live-paper
pkgver=0.4.1
pkgrel=1
pkgdesc="A Wayland video wallpaper engine (prebuilt binary)"
arch=('x86_64')
url="https://github.com/sinder38/live-paper-rs"
license=('MIT')
depends=('mpv' 'wayland' 'libglvnd')
provides=('live-paper')
conflicts=('live-paper')
source=("$_pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/live-paper-linux-x86_64.tar.gz"
        "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
        "config.example-$pkgver.toml::$url/raw/v$pkgver/config.example.toml")
sha256sums=('e2cc9083232c9f047f5ae1bd77afe8287fc2a8bd551be10d0f5ea589f6a863dc'
            '1c602b2b246b5b2decd611a21c3e20456f442b1b585b60222e10836aed53c0d9'
            '1db4595ae8180484d7b4b8f81059c6bc5ff38cd32795eaa40fe7cb779265b7ba')

package() {
    install -Dm755 "$srcdir/live-paper-linux-x86_64" "$pkgdir/usr/bin/live-paper"
    install -Dm644 "$srcdir/LICENSE-$pkgver" \
        "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    # Ship the sample config as documentation
    install -Dm644 "$srcdir/config.example-$pkgver.toml" \
        "$pkgdir/usr/share/doc/$_pkgname/config.example.toml"
}
