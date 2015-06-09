# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: TingPing <tingping@fedoraproject.org>
# Contributor: Christopher Eby <kreed@kreed.org>
# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=pithos
pkgver=1.1.1
pkgrel=1
pkgdesc='Pandora Internet Radio player for GNOME'
arch=('any')
url="http://pithos.github.io/"
license=('GPL3')
depends=('python' 'gtk3' 'python-gobject'
         'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-base'
         'python-setuptools' 'python-cairo')
optdepends=('libkeybinder3: for media keys plugin'
            'gst-plugins-ugly: MP3 playback support'
            'libappindicator-gtk3: Unity indicator applet support'
            'python-pacparser: PAC proxy support'
            'python-pylast: Last.fm scrobbling support'
            'libnotify: Notification support'
            'python-dbus: MPRIS/Screensaver Pause/Gnome mediakeys support')
source=("https://github.com/pithos/pithos/archive/${pkgver}.tar.gz")
install="$pkgname.install"
sha256sums=('4424534bbf7ab3d3d6c51764d689606fd0df214422eb79ccc91a8981f95d7dce')

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}/"
}
