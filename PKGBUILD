# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Bjoern Franke <bjo at nord-west.org>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Benjamin Richter <br@waldteufel-online.net>
# Contributor: Changaco <changaco@changaco.net>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer [at] student [dot] tugraz [dot] at>

_name=gajim
pkgname="$_name-git"
pkgver=1.0.0.beta1.r977.gc63e32634
pkgrel=1
pkgdesc="Jabber/XMPP instant messenger client written in Python with GTK+"
arch=('any')
url="https://gajim.org/"
license=('GPL3')
depends=('python-gobject' 'python-pyopenssl' 'hicolor-icon-theme'
         'python-pyasn1' 'python-nbxmpp-git' 'python-cairo' 'python-keyring'
         'python-distro' 'python-cssutils' 'python-precis_i18n')
makedepends=('git' 'python-setuptools')
optdepends=('python-dbus: for gajim-remote and zeroconf support'
            'farstream: for video/voice support'
            'gst-plugins-good: for video/voice support'
            'gst-plugins-bad: for video/voice support'
            'gst-plugins-ugly: for video/voice support'
            'gst-libav: for video/voice support'
            'gst-python: for video/voice support'
            'gspell: for spell checking support'
            'libxss: for idle time checking on X11'
            'notification-daemon: for desktop notifications'
            'gnome-keyring: store passwords encrypted in GNOME Keyring'
            'kded: store passwords encrypted in KSecretService'
            'python-crypto: support for E2E encryption'
            'python-docutils: for RST generator support'
            'gupnp-igd: for UPnP-IGD support'
            'geoclue2: for sharing your location')
provides=('gajim')
conflicts=('gajim' 'gajim-hg' 'gajim-svn')
replaces=('gajim-hg' 'gajim-svn')
source=("$_name::git+https://dev.gajim.org/gajim/gajim.git/")
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --tags | sed 's/^gajim-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $_name
  python setup.py install --root="$pkgdir/" --optimize=1
}
