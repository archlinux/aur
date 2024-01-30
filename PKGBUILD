# Submitter: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=python-github-backup
_pkgname=github-backup
pkgver=0.45.0
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
sha512sums=('f349d4e10860e1c2b1565170a724996e04ece5c4c7e47267f37ea88a65e9c6480b86bf9d72692659c4184f77385e4950a9c6071a466ac5b947c076dbad97b4cd')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

