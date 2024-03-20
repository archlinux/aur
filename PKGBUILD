# Submitter: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=python-github-backup
_pkgname=github-backup
pkgver=0.45.1
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
sha512sums=('68d54c815159a50ec32c052176a9bcd47ced9f12b5f230b810c0fb8b526fbf2f3e2e1874d0bf64a61721b3030cbbb0838acf5f4d57d007f97e3d1aa0300a7165')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

