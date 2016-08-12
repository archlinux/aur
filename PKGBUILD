# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris-git
pkgver=0.3.7.3.r1.6f47861
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'polkit' 'xorg-xrandr'
         'python-dbus' 'python-gobject' 'python-xdg' 'python-yaml'
         'xdg-user-dirs')
makedepends=('git' 'python-setuptools')
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
