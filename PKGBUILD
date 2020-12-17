# Maintainer: Linux Gamers <linuxgamers@protonmail.com>

_pkgname=lutris
pkgname=${_pkgname}-release
pkgver=0.5.8.1
_pkgver=v${pkgver}
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url="https://github.com/lutris/lutris"
license=('GPL3')
depends=('python-gobject' 'python-yaml' 'python-evdev' 'python-dbus' 'gtk3' 'glib2' 'psmisc' 'cabextract' 'unzip' 'p7zip' 'curl' 'xorg-xrandr' 'gnome-desktop' 'python-requests' 'python-pillow' 'mesa-demos' 'python-distro')
makedepends=('git' 'python-setuptools')
provides=('lutris')
conflicts=('lutris' 'lutris-git')
source=("${url}/archive/${_pkgver}.tar.gz")
sha512sums=('27f9dd30304eb132476958e56b0a4c27ff78b8e294465cb2646212cca2f9dd640849690ce797ef905b5a3ddb9f636badf0201672b99f6f88a2ed4438a0382e5b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build || return 1
}
