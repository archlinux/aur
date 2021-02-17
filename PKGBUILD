# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_timesheet_cost
_name=trytond_timesheet_cost
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add cost on timesheet"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9f61cb718e849c89f10fa1cdc301f7969160ae6b505c1bee561e6185ae44006d')
sha512sums=('92e12f6b1df81b8460e1e5e8adb17b12a3d59fed44c02ef98571708de85b57e9ad47578db968eebfddf3ab2ae66f9c221900c7b9e91f10932b33dfbc94fdf986')
b2sums=('6acd33e5fdb029578eee5b5e031bd5fe2b6c056b286934332b25e4d00de47c544a7d54692022c0e78f4359142186208d717121a8d5b7a9a97bb7d2286b5671f0')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
