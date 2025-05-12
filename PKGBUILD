# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=itango
pkgver=0.3.0
pkgrel=1
pkgdesc="An interactive Tango client."
groups=('tango-controls')
arch=('x86_64' 'armv7h')
url="https://github.com/tango-controls/itango"
license=('GPL3')
depends=('python-pytango>=9.2' 'ipython>=1.0' 'python-qtconsole')
conflicts=('itango-git')
source=("git+https://gitlab.com/tango-controls/itango.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
