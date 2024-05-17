# Submitter: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=python-github-backup
_pkgname=github-backup
pkgver=0.45.2
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
sha512sums=('3ecb6bb20b8151ec774ab741dd3176ff87fb26e427ad1928d8b4ab9ff89fd26bc65585a8df39ed4272ab23e19359192c2b26849f8d7d456e5da0a21b3df21216')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

