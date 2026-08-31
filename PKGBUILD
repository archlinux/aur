# Maintainer: xiryuu < farrel2008ganteng@protonmail.com >
pkgname=limusic-bin
_pkgname=limusic
pkgver=0.6.6
pkgrel=1
pkgdesc="Feature rich, native desktop, YouTube Music client. Tauri + Rust + SvelteKit, ad-free playback through libmpv, Last.fm scrobbling and Discord Rich Presence, no Electron."
arch=("x86_64")
url="https://github.com/SimoHypers/limusic"
license=("GPL-3.0-or-later")
depends=("libsoup3" "glib2" "glibc" "webkit2gtk-4.1" "dbus" "gtk3" "hicolor-icon-theme" "cairo" "libgcc" "libmpv.so=2-64" "gdk-pixbuf2" "openssl")
options=("!strip" "!buildflags")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/SimoHypers/limusic/releases/download/v${pkgver}/limusic_${pkgver}_amd64.deb")
sha256sums=("023ef200696f78c2d03a9c25398c8f8c984a46cde4f56d85e594ee4f42705c69")

prepare() {
  tar -xf data.tar.*
}

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
