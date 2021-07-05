# Maintainer: Joshua Haase <hahj87@gmail.com>

_pkgname=errorhandler
pkgname="python-errorhandler"
pkgver=2.0.1
pkgrel=1
pkgdesc="A logging framework handler that tracks when messages above a certain level have been logged."
arch=("x86_64")
url="https://pypi.org/project/errorhandler/"
license=("BSD")
depends=("python")
makedepends=("git" "python-setuptools")
provides=("python-errorhandler")
conflicts=()
source=("https://files.pythonhosted.org/packages/ee/f4/6efa866dfb5b72d468666eb69adc19142e3956af8e6a95f3109d29685038/errorhandler-${pkgver}.tar.gz")
sha256sums=('7e578ad67af40845bfd044f71627a29f1fc436d53ccb058bbf1792ef31ab6163')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
