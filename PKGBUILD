# Maintainer: sinder <smirnov.sinder@gmail.com>
pkgname=live-paper-bin
_pkgname=live-paper
pkgver=0.4.0
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
sha256sums=('db1687a83077a0b0df0f431fea466e10d81665a0760286852c0fdc1add784f96'
            '1c602b2b246b5b2decd611a21c3e20456f442b1b585b60222e10836aed53c0d9'
            '6a7d64d698e6cf5d2319a80e9aed825ff45340dda44a1699d8976159ec5131af')

package() {
    install -Dm755 "$srcdir/live-paper-linux-x86_64" "$pkgdir/usr/bin/live-paper"
    install -Dm644 "$srcdir/LICENSE-$pkgver" \
        "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    # Ship the sample config as documentation
    install -Dm644 "$srcdir/config.example-$pkgver.toml" \
        "$pkgdir/usr/share/doc/$_pkgname/config.example.toml"
}
