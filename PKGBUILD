# Maintainer: fft <anonim288@gmail.com>

pkgname=open-numismat-git
pkgver=1.7.3.r0.g89ebda1
pkgrel=1
pkgdesc='Application to create, organize and manage coin catalogue'
arch=('any')
url="https://opennumismat.github.io/open-numismat/"
license=('GPL3')
makedepends=('git' 'python-setuptools')
depends=('python' 'python-pyqt5' 'python-xlrd' 'python-numpy' 'python-matplotlib' 'python-jinja' 'python-lxml' 'python-dateutil')
optdepends=(
  'python-xlwt: export to excel'
  'python-pyodbc: import from CoinManage and Numizmatik_Ru')
source=("${pkgname}::git+https://github.com/OpenNumismat/open-numismat.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
