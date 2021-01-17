# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_web_user
_name=trytond_web_user
pkgver=5.8.2
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to manage Web users"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9ea6e1a7c7c592632895c00bd8c38b62bd9fb876faef6bf604eef631da5bc0da')
b2sums=('a5208be3be7034bca3421ff528697077b5d011e7d8cc92b0da9519697014795019a6f080ad5e9f523c69060e4ee01ea90ea7dc5de18a2c417662ca8998719ff5')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
