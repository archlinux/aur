# Maintainer: Andy Kluger <https://t.me/andykluger>
# Maintainer: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: Milo Mirate <mmirate@gmx.com>

_name=plumbum
_ghrepo=tomerfiliba/$_name

pkgname=python-$_name
pkgdesc="A small yet feature-rich Python library for shell script-like programs, and more"
url="https://pypi.python.org/pypi/plumbum"

pkgver=1.7.0
pkgrel=2
sha256sums=('317744342c755319907c773cc87c3a30adaa3a41b0d34c0ce02d9d1904922dce')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")

depends=(python)
makedepends=(python-setuptools python-setuptools-scm python-toml)
optdepends=('python-paramiko: use pure Python for SSH2')

arch=('any')
license=('MIT')

build () {
  cd "$_name-$pkgver"
  python setup.py build
}

package () {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
