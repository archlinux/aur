# Maintainer: Linux Gamers <linuxgamers@protonmail.com>

_pkgname=lutris
pkgname=${_pkgname}-release
pkgver=0.5.3
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
sha512sums=('c48be1cf1efada290847d86876dae40346142b041119e6c6733e41e27c0277771647992e5475bfa3a71b639a0d9ff2e2ca3527612cc1a723aa0bac46960606c9')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build || return 1
}
