# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>
pkgname=python-simplenote
pkgver=2.1.4
pkgrel=1
pkgdesc="Python API wrapper for the Simplenote web service"
arch=("any")
url="https://github.com/simplenote-vim/simplenote.py"
license=('MIT')
depends=('python' 'python-simplejson')
makedepends=('python-setuptools')
provides=('python-simplenote')
source=("${pkgname}.tar.gz::https://github.com/simplenote-vim/simplenote.py/archive/v${pkgver}.tar.gz")
sha256sums=('4ca8114218c44fe54256b8f392bdcf16bf53939f04aada891a16a1a981a10bc4')

build() {
  cd "${srcdir}/simplenote.py-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${srcdir}/simplenote.py-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
