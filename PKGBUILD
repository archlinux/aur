# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=gmusicbrowser
pkgver=1.1.14
pkgrel=2
pkgdesc="A customizable open-source jukebox for large collections"
arch=('any')
url="http://gmusicbrowser.org"
license=('GPL3')
depends=('gtk2-perl' 'hicolor-icon-theme')
optdepends=('alsa-utils: enables the ALSA backend'
            'flac123: flac support for the ALSA backend'
            'mpg321: mp3 support for the ALSA backend'
            'vorbis-tools: vorbis support for the ALSA backend'
            'mplayer: enables the mplayer backend'
            'perl-glib-object-introspection: enables the gstreamer backend'
            'gst-plugins-base: vorbis support for the gstreamer backend' 
            'gst-plugins-good: flac support for the gstreamer backend'
            'gst-plugins-bad: mpc support for the gstreamer backend'
            'gst-plugins-ugly: mp3 support for the gstreamer backend'
            'perl-gstreamer: enables the gstreamer0.10 backend'
            'gstreamer0.10-base: vorbis support for the gstreamer0.10 backend' 
            'gstreamer0.10-good-plugins: flac support for the gstreamer0.10 backend'
            'gstreamer0.10-bad-plugins: mpc support for the gstreamer0.10 backend'
            'gstreamer0.10-ugly-plugins: mp3 support for the gstreamer0.10 backend'
            'perl-locale-gettext: localization support'
            'perl-gtk2-trayicon: tray icon support'
            'perl-gtk2-appindicator: app indicator plugin support'
            'perl-gtk2-mozembed: web-based plugins support'
            'perl-gtk2-webkit: alternative web-based plugin support'
            'perl-net-dbus: control gmusicbrowser through dbus and gnome hotkeys'
            'perl-gtk2-notify: show notifications using libnotify'
            'perl-html-parser: support for accented characters in lyrics plugin')
conflicts=('gmusicbrowser-devel' 'gmusicbrowser-development' 'gmusicbrowser-git' 'gmusicbrowser-shimmer' 'gmusicbrowser-shimmer-git')
options=('!libtool')
install=$pkgname.install
source=($url/download/$pkgname-$pkgver.tar.gz)
md5sums=('8eb2d3f22e0734a7f5efbf4f0b2bd71e')

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir/" install

  # put some images in sane locations
  install -Dm644 pix/trayicon.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/gmusicbrowser.png
  install -Dm644 pix/gmusicbrowser32x32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/gmusicbrowser.png
  install -Dm644 pix/gmusicbrowser.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/gmusicbrowser.png
  install -Dm644 pix/gmusicbrowser.png "$pkgdir"/usr/share/pixmaps/gmusicbrowser.png
}
