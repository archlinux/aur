# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris-git
pkgver=0.4.20.r5.54ad3b92
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'polkit' 'xorg-xrandr'
         'python-dbus' 'python-gobject' 'python-yaml' 'python-evdev'
         'lib32-sqlite')
makedepends=('git' 'python-setuptools')
optdepends=(
  'python-evdev: Detecting connected joypads.'
  'python-pyinotify: Enhanced Steam integration.'
  )
provides=('lutris')
conflicts=('lutris')
source=('git+https://github.com/lutris/lutris.git')
sha256sums=('SKIP')

pkgver() {
  cd lutris

  git describe --tags | sed 's/v//; s/-/.r/; s/-g/./'
}

package() {
  cd lutris

  python setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
