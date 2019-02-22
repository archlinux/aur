# Maintainer: liara (liara at archlinux.email)

pkgname=python-shodan
pkgver=1.11.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/1d/3e/64996c10c321922308bb03c2b93ee91e0487c6fe1567e1b586571fa42eaf/shodan-${pkgver}.tar.gz)
sha256sums=('8d316d033acdc0d9cf3a152d4db9ebdbcd1ade832a9dd798bf9a569dbddb4811')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
