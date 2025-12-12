# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="handy-bin"
pkgver=0.6.7
pkgrel=1
pkgdesc="A free, open source, and extensible speech-to-text application that works completely offline"
url="https://handy.computer/"
license=("MIT")
arch=("x86_64")
depends=(
    "alsa-lib"
    "cairo"
    "gcc-libs"
    "gdk-pixbuf2"
    "glib2"
    "glibc"
    "gtk3"
    "hicolor-icon-theme"
    "libappindicator-gtk3"
    "libsoup3"
    "openssl"
    "vulkan-icd-loader"
    "webkit2gtk-4.1"
)
source=("$pkgname-$pkgver.deb::https://github.com/cjpais/Handy/releases/download/v${pkgver}/Handy_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/cjpais/Handy/refs/heads/main/LICENSE")
b2sums=('64c219bf672f8f3be4676400c6636d069584c89785ea0bf340dd44fef1770972a95d857bc92388d7a7875cf19c3714d0765f995915bdbff9f600f2b36bfae50c'
        '48678eca5b87a0b59038c8b343d84073207bca4390ad40ac81f2f96dc553cc66453f0f6331749d4686aa7153875bdaf2e08b2adf2bef023ee6044518955a7950')

package(){
    bsdtar -xf "data.tar.gz" -C "$pkgdir"
    install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
