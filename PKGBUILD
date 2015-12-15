# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris
pkgver=0.3.6.3
pkgrel=2
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('desktop-file-utils' 'glib-networking' 'gvfs' 'hicolor-icon-theme'
         'polkit' 'python2-gobject' 'python2-xdg' 'python2-yaml' 'xorg-xrandr')
makedepends=('python2-setuptools')
install='lutris.install'
source=("https://lutris.net/releases/lutris_${pkgver}.tar.gz")
sha256sums=('a9061403ef8844b2c1443b1c5f15fe98af224d652d66268b47ae8e215e289058')

prepare() {
  cd lutris

  sed -i 's|^#!.*python$|#!/usr/bin/python2|' $(grep -rl '^#!.*python')
}

package() {
  cd lutris

  python2 setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
