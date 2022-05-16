# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-rxv
_name=rxv
pkgver=0.7.0
pkgrel=2
pkgdesc="Automation Library for Yamaha RX-V473, RX-V573, RX-V673, RX-V773 receivers."
arch=('any')
url='https://github.com/wuub/rxv'
license=('BSD')
depends=('python-defusedxml')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6e21f6e5e808ed28147633633b1073f22f30ed84cf47868d970598cefe2b98a9')

build() {
  cd "${srcdir}/rxv-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/rxv-${pkgver}"
  python -m installer --destdir=${pkgdir} dist/*.whl
}

# vim:set ts=2 sw=2 et:
