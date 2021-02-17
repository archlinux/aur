# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_project_plan
_name=trytond_project_plan
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add planning capabilities on projects"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7f5144ea46872f83db68a1fbd368ef5fa58b463c6c591be7db83bcc1f5268231')
sha512sums=('22677ae1c6031e21d6a632e897689d79ca0e6254a693b306c2d0f6144e78f102c024da9c5966d5496309fec75722ed3e611b4b6c891a86a173e89d27c22fd413')
b2sums=('2a09255e78a5e3d48f7000532d378cb428576d14a9175ed5245f684b1fcc58010f58bd06d9863b4b746ee8d7e89711d785237542914ec14e602cc1e707da4701')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
