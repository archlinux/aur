# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=itango
pkgver=0.1.8
pkgrel=1
pkgdesc="An interactive Tango client."
groups=('tango-controls')
arch=('x86_64' 'armv7h')
url="https://github.com/tango-controls/itango"
license=('GPL3')
depends=('python-pytango>=9.2' 'ipython>=1.0' 'python-qtconsole')
conflicts=('itango-git')
source=("https://gitlab.com/tango-controls/${pkgname}/-/archive/${pkgver}/itango-${pkgver}.tar.gz")
sha256sums=('29542b148b5e2c8ea95f3b060ec37a4bd0a88d933992fcaca45d9438eabe481c')


build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root=$pkgdir/
}
