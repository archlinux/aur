# Maintainer: Ludovico de Nittis <aasonykk+aur at google mail dot com>
# Contributor: Profpatsch <mail AT [nickname] DOT de>

pkgname=gnome-keysign
pkgver=0.9.9
pkgrel=1
pkgdesc="An easier way to sign OpenPGP keys over the local network or Bluetooth."
arch=('any')
url="https://github.com/gnome-keysign/gnome-keysign"
license=('GPL3')
install=gnome-keysign.install
depends=('python' 'python-cairo' 'python-dbus' 'python-future' 'python-gobject' 'python-gpgme'
         'python-qrcode' 'python-requests' 'python-twisted' 'avahi' 'dbus'
         'gst-plugins-good' 'gst-plugins-bad' 'magic-wormhole' 'zbar')
optdepends=('python-pybluez: Bluetooth support')
makedepends=('git' 'python-setuptools' 'python-lxml')
_commit=2a67b564057ceb7e4a9cb20b1d15669b80ce16d3  # tags/0.9.9
source=("git+https://gitlab.gnome.org/GNOME/gnome-keysign.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    cd $pkgname
    python setup.py build
}

package() {
    cd $pkgname
    python setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}
