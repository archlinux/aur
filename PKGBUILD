# Maintainer: xiryuu < farrel2008ganteng@protonmail.com >
pkgname=limusic-bin
_pkgname=limusic
pkgver=0.5.9
pkgrel=1
pkgdesc="Feature rich, native desktop, YouTube Music client. Tauri + Rust + SvelteKit, ad-free playback through libmpv, Last.fm scrobbling and Discord Rich Presence, no Electron."
arch=("x86_64")
url="https://github.com/SimoHypers/limusic"
license=("GPL-3.0-or-later")
depends=("libsoup3" "glib2" "glibc" "webkit2gtk-4.1" "dbus" "gtk3" "hicolor-icon-theme" "cairo" "libgcc" "libmpv.so=2-64" "gdk-pixbuf2")
options=("!strip" "!buildflags")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/SimoHypers/limusic/releases/download/v${pkgver}/limusic_${pkgver}_amd64.deb")
sha256sums=("9cc9149d1a4f5b8e93b7a992c5eb5b237e0001554255e4cc0ebb6cf801415643")

prepare() {
  tar -xf data.tar.*
}

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
