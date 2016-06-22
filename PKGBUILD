# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=gmusicbrowser
pkgver=1.1.15
pkgrel=6
pkgdesc="A customizable open-source jukebox for large collections"
arch=('any')
url="http://gmusicbrowser.org"
license=('GPL3')
depends=('gtk2-perl' 'hicolor-icon-theme' 'perl-net-dbus')
optdepends=('alsa-utils: enables the ALSA backend'
            'flac123: flac support for the ALSA backend'
            'mpg321: mp3 support for the ALSA backend'
            'vorbis-tools: vorbis support for the ALSA backend'
            'mplayer: enables the mplayer backend'
            'mpv: enables the mpv backend'
	    'gstreamer: enables the gstreamer backend'
            'perl-glib-object-introspection: enables the gstreamer backend'
            'gst-plugins-base: vorbis support for the gstreamer backend' 
            'gst-plugins-good: flac support for the gstreamer backend'
            'gst-plugins-bad: mpc support for the gstreamer backend'
            'gst-plugins-ugly: mp3 support for the gstreamer backend'
            'perl-gstreamer: enables the old gstreamer0.10 backend'
            'gstreamer0.10-base: vorbis support for the gstreamer0.10 backend' 
            'gstreamer0.10-good-plugins: flac support for the gstreamer0.10 backend'
            'gstreamer0.10-bad-plugins: mpc support for the gstreamer0.10 backend'
            'gstreamer0.10-ugly-plugins: mp3 support for the gstreamer0.10 backend'
            'perl-locale-gettext: localization support'
            'perl-gtk2-trayicon: tray icon support'
            'perl-gtk2-appindicator: app indicator plugin support'
            'perl-gtk2-mozembed: web-based plugins support'
            'perl-gtk2-webkit: alternative web-based plugin support'
            'perl-gtk2-notify: show notifications using libnotify'
            'perl-html-parser: support for accented characters in lyrics plugin')
conflicts=('gmusicbrowser-git' 'gmusicbrowser-shimmer' 'gmusicbrowser-shimmer-git')
options=('!libtool')
install=$pkgname.install
source=("$url/download/$pkgname-$pkgver.tar.gz"
	"perl524.patch")
md5sums=('4a16dcbe369d4b3cb78fb1a6967a60b3'
	'2073c1f657d9226326807cabda6a894c')

package() {
  cd "$srcdir"
  patch -p0 < perl524.patch
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
