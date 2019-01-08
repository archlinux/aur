# Maintainer: Ludovico de Nittis <aasonykk+aur at google mail dot com>
# Contributor: Profpatsch <mail AT [nickname] DOT de>

pkgname=gnome-keysign
pkgver=1.0.0
pkgrel=1
pkgdesc="An easier way to sign OpenPGP keys over the local network or Bluetooth."
arch=('any')
url="https://github.com/gnome-keysign/gnome-keysign"
license=('GPL3')
install=gnome-keysign.install
depends=('python' 'python-cairo' 'python-dbus' 'python-future' 'python-gobject' 'python-gpgme'
         'python-qrcode' 'python-requests' 'python-twisted' 'avahi' 'dbus'
         'gst-plugins-good' 'gst-plugins-bad' 'python-magic-wormhole' 'zbar')
optdepends=('python-pybluez: Bluetooth support')
makedepends=('git' 'python-setuptools' 'python-lxml')
_commit=cdd747788832ea883ca838e4e7400ce0f007ea24  # tags/1.0.0
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
