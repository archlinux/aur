# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=ipyxact
pkgname=python-$_pkgname
pkgver=0.2.4
pkgrel=3
pkgdesc='Python-based IP-XACT parser'
arch=('any')
url='https://github.com/olofk/ipyxact'
license=('MIT')
depends=('python' 'python-yaml')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6a3cc94477dee65d91eeaac908a7ed3cc52686d85f448e0e1f85c25aaf79ea15edf87135539e7a2319e6b54a62cd32ab2cdb1771e14a223cafb4d529dbf035d5')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
