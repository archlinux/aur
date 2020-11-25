# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Spike29 <leguen.yannick@gmail.com>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=gmusicbrowser
pkgver=1.1.16
pkgrel=1
pkgdesc="Open-source jukebox for large collections of mp3/ogg/flac files, written in perl."
arch=(any)
url="https://gmusicbrowser.org/"
license=(GPL3)
depends=(gtk2-perl perl-net-dbus perl-locale-gettext perl-glib-object-introspection)
makedepends=(discount)
optdepends=('alsa-utils: enables the ALSA backend'
            'flac123: flac support for the ALSA backend'
            'mpg321: mp3 support for the ALSA backend'
            'vorbis-tools: vorbis support for the ALSA backend'
            'mplayer: enables the mplayer backend'
            'mpv: enables the mpv backend'
            'gst-plugins-base: vorbis support'
            'gst-plugins-good: flac support'
            'gst-plugins-ugly: mp3 support'
            'perl-gtk2-trayicon: tray icon support'
            'perl-gtk2-webkit: alternative web-based plugin support'
            'perl-gnome2-wnck: titlebar plugin support'
            'perl-html-parser: support for accented characters in lyrics plugin'
            'perl-gtk2-notify: support for notify plugin')
source=("$url/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c7f10578ca3008e966e66c33a4887020e4b99b6aa5580c4b4771ee228ff603fe')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
