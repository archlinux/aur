# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=pogo-git
pkgver=0.9.r0.ga2f1ffb
pkgrel=1
pkgdesc='Plays your music. Nothing else.'
arch=('any')
url='https://github.com/jendrikseipp/pogo'
license=('GPL')
depends=('pygtk' 'gst-python' 'python-mutagen' 'python-dbus' 'python-pillow' 'gtk3')
makedepends=('git')
optdepends=('libnotify: desktop notifications'
            'gnome-settings-daemon: GNOME media keys'
            'pulseaudio: PulseAudio support'
            'gst-plugins-good: PulseAudio support and good codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs'
            'gst-libav: libav codec')
conflicts=('pogo')
provides=('pogo')
source=("git+https://github.com/jendrikseipp/pogo.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
