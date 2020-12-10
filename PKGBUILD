# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-pyquota
pkgver=0.0.3
pkgrel=2
pkgdesc="A simple python wrapper for C apis of quotactl"
url="https://github.com/tjumyk/pyquota"
arch=('any')
provides=('python-pyquota')
depends=('python')
makedepends=('python-setuptools')
_name="${pkgname#python-}"
_Name="PyQuota"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_Name-$pkgver.tar.gz")
sha256sums=('cc45e0ef02100356b8d05d68ea5fdad93cd7ce99020fdc8c547945432a1409b7')

build() {
  cd "$srcdir/$_Name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_Name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
