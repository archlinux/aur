# Maintainer: Linux Gamers <linuxgamers@protonmail.com>

_pkgname=lutris
pkgname=${_pkgname}-release
pkgver=0.5.8
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
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('dceb7708c98feb713d2e57cbf05cd37300cb32948d54275c3df4dbfc3260261b1baae0a13f6acf0bf3bd314b1ea437cd810a055d9ba6a767d27124cac65221e9')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build || return 1
}
