# Maintainer: Linux Gamers <linuxgamers@protonmail.com>

_pkgname=lutris
pkgname=${_pkgname}-release
pkgver=0.5.1.1
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
sha512sums=('3f036839ee7487aa25aa4c4fa7ce7e847fb660a6b5d3a3e2bd1ecf72ced9f43d425cc2152e87b71c09c37589b4ada26f3a9677a18fb73eba1d36dc4aa3bb20ac')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build || return 1
}
