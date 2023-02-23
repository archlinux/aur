# Submitter: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Maintainer: Mahor1221<mahor1221@gmail.com>

pkgname=python-github-backup
_pkgname=github-backup
pkgver=0.42.0
pkgrel=1
pkgdesc="Backup a github user or organization."
arch=(any)
url="https://github.com/josegonzalez/python-github-backup"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
provides=("$pkgname" "$_pkgname")
conflicts=("$pkgname" "$_pkgname")
source=("https://files.pythonhosted.org/packages/source/g/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('1e60efffaa2c0d986eabfd5fcb8e005a80a7750c996456096d7b35d5a28faac0e9f00c26468767bf06e98e7359842104c55d056b813d3ef3c0d61ed09001e298')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

