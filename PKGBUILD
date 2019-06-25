# Maintainer: James An <james@jamesan.ca>

pkgname=python2-argparse
_pkgname=${pkgname#python2-}
pkgver=1.4.0
pkgrel=1
pkgdesc='Python2 command-line parsing library.'
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('Python')
depends=('python2')
makedepends=('python2-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('08062d2ceb6596fcbc5a7e725b53746f')

build() {
  cd "$_pkgname-$pkgver"

  python2 setup.py build
}

check() {
  cd "$_pkgname-$pkgver"

  python2 setup.py test
}

package() {
  cd "$_pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
  find $pkgdir -type f -exec chmod 0644 {} +
  find $pkgdir -type d -exec chmod 0755 {} +
}
