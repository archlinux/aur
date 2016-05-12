# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: TingPing <tingping@fedoraproject.org>
# Contributor: Christopher Eby <kreed@kreed.org>
# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=pithos
pkgver=1.1.2
pkgrel=2
pkgdesc='Native Pandora Radio client'
arch=('any')
url="http://pithos.github.io/"
license=('GPL3')
depends=('python>=3.5' 'gtk3' 'python-gobject'
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
sha256sums=('560cc42410981c4578505bf67635c75d11b63fe8ff5d4d73e154e016e7fe5465')

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}/"
}
