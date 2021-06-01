# Maintainer: Doug Newgard <scimmia at archlinux dot org>

_pkgname=quasselgrep
pkgname=$_pkgname-git
pkgver=r95.g9b6b0bc
pkgrel=3
pkgdesc='Tool for searching quassel logs from the commandline'
arch=('any')
url='https://github.com/fish-face/quasselgrep'
license=('GPL')
depends=('python' 'python-setuptools' 'python-dateutil' 'python-future' 'python-pycryptodome')
makedepends=('git')
optdepends=('python-psycopg2: Connect to postgres databases')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=('git+https://github.com/fish-face/quasselgrep.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname

  python setup.py install --root="$pkgdir" --optimize=1
}
