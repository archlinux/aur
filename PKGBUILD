# Maintainer: RobbeR49 <robertsna@gmail.com>

pkgname=gmusicbrowser-git
pkgver=1.1.14.r45.g1fe444d
pkgrel=1
pkgdesc="An open-source jukebox for large collections of mp3/ogg/flac files, written in perl."
arch=('i686' 'x86_64')
url="http://squentin.free.fr/gmusicbrowser/gmusicbrowser.html"
license=('GPL3')
depends=('gtk2-perl')
makedepends=('git' 'markdown')
optdepends=('alsa-utils: enables the ALSA backend'
            'flac123: flac support for the ALSA backend'
            'mpg321: mp3 support for the ALSA backend'
            'vorbis-tools: vorbis support for the ALSA backend'
            'mplayer: enables the mplayer backend'
            'mpv: enables the mpv backend'
            'perl-glib-object-introspection: enables gstreamer-1.x backend'
            'gst-plugins-base: vorbis support'
            'gst-plugins-good: flac support'
            'gst-plugins-ugly: mp3 support'
            'perl-gstreamer: enables the gstreamer0.10 backend'
            'gstreamer0.10-base: vorbis support for the gstreamer0.10 backend' 
            'gstreamer0.10-good-plugins: flac support for the gstreamer0.10 backend'
            'gstreamer0.10-ugly-plugins: mp3 support for the gstreamer0.10 backend'
            'perl-gtk2-trayicon: tray icon support'
            'perl-gtk2-mozembed: web-based plugins support'
            'perl-gtk2-webkit: alternative web-based plugin support'
            'perl-locale-gettext: localization support'
            'perl-net-dbus: control gmusicbrowser through dbus and gnome hotkeys'
            'perl-gnome2-wnck: titlebar plugin support'
            'perl-html-parser: support for accented characters in lyrics plugin'
            'perl-gtk2-notify: support for notify plugin')
conflicts=('gmusicbrowser' 'gmusicbrowser-devel')
source=("${pkgname}::git+http://github.com/squentin/gmusicbrowser.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}      

build() {
   cd "${srcdir}/${pkgname}"
   make
}

package() {
   cd "${srcdir}/${pkgname}"
   make DESTDIR="$pkgdir" install
}
