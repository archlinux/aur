# Maintainer: Linux Gamers <linuxgamers@protonmail.com>

_pkgname=lutris
pkgname=${_pkgname}-release
pkgver=0.5.2
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
sha512sums=('2d84c9cfae4e628b9abf10859735d8ac99710659e134ebfcbb6c3d1c891a07a2ae291b651181348c4e4fdf55828420db815d4674d561a95371b9c4e061799d58')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build || return 1
}
