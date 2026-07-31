# Maintainer: sinder <smirnov.sinder@gmail.com>
pkgname=live-paper-bin
_pkgname=live-paper
pkgver=0.2.0
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
sha256sums=('4fb72634b42eda845f46f096f17dd4e27f7cfd12de8a1bd6c5db87202bd6a53f'
            '1c602b2b246b5b2decd611a21c3e20456f442b1b585b60222e10836aed53c0d9'
            'c6f43619f395b3dc3d801cbd3cedd3b11e3238a2a725d6b28e70d9e919d02700')

package() {
    install -Dm755 "$srcdir/live-paper-linux-x86_64" "$pkgdir/usr/bin/live-paper"
    install -Dm644 "$srcdir/LICENSE-$pkgver" \
        "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    # Ship the sample config as documentation
    install -Dm644 "$srcdir/config.example-$pkgver.toml" \
        "$pkgdir/usr/share/doc/$_pkgname/config.example.toml"
}
