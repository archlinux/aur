# Submitter: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=python-github-backup
_pkgname=github-backup
pkgver=0.43.1
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
sha512sums=('05e7c8f1472099586e998f1375200d48149124bc783ab957f903ab265f246415fd53e8b8317a0e6f470048f4144c257fc135a41e6eb5bae50709fa13479a9b99')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

