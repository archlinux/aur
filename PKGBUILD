# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="handy-bin"
pkgver=0.6.5
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
b2sums=('a09e7109ba9c874f74e0217f3241526b97b5b537d89f3a1ae014680aa5c1a0e88bc8a318d3b5de1904a949ca9ce4594a93a916b4d4cb558e55b69f36559fb561'
        '48678eca5b87a0b59038c8b343d84073207bca4390ad40ac81f2f96dc553cc66453f0f6331749d4686aa7153875bdaf2e08b2adf2bef023ee6044518955a7950')

package(){
    bsdtar -xf "data.tar.gz" -C "$pkgdir"
    install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
