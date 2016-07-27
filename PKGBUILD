# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: TingPing <tingping@fedoraproject.org>
# Contributor: Christopher Eby <kreed@kreed.org>
# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=pithos
pkgver=1.2.0
pkgrel=1
pkgdesc='Native Pandora Radio client'
arch=('any')
url="https://pithos.github.io/"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'libsecret' 'python-cairo'
         'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-base')
optdepends=('libkeybinder3: for media keys plugin'
            'gst-plugins-ugly: MP3 playback support'
            'libappindicator-gtk3: Unity indicator applet support'
            'python-pacparser: PAC proxy support'
            'python-pylast: Last.fm scrobbling support'
            'libnotify: Notification support'
            'python-dbus: MPRIS/Screensaver Pause/Gnome mediakeys support')
makedepends=('intltool')
source=("https://github.com/pithos/pithos/releases/download/${pkgver}/pithos-${pkgver}.tar.xz")
sha256sums=('46ab6f09aa2d0ae5a7d76b4cebb532e098a055657b25a9484d77e86e86e99860')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  DESTDIR="$pkgdir" make install
}
