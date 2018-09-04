# Maintainer: Ave Ozkal <aurpub@ave.zone>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Bjoern Franke <bjo at nord-west.org>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Benjamin Richter <br@waldteufel-online.net>
# Contributor: Changaco <changaco@changaco.net>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer [at] student [dot] tugraz [dot] at>

_name=gajimbo
pkgname="$_name-git"
pkgver=v1.0.99.0.g76758ffc9
pkgrel=1
pkgdesc="A fork of Gajim with various enhancements, written in Python with GTK+"
arch=('any')
url="https://git.a3.pm/a/gajimbo"
license=('GPL3')
depends=('python-gobject' 'python-pyopenssl' 'hicolor-icon-theme'
         'python-pyasn1' 'python-nbxmpp' 'python-cairo' 'python-keyring'
         'python-distro')
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
conflicts=('gajim' 'gajim-hg' 'gajim-svn' 'gajim-git')
source=("$_name::git+https://gitlab.com/aoz/gajimbo")
md5sums=('SKIP')

pkgver() {
  cd $_name
  # git rev-parse HEAD | cut -c1-10
  git describe --long --tags | tr - .
}

package() {
  cd $_name
  python setup.py install --root="$pkgdir/" --optimize=1
}

