# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_project
_name=trytond_project
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module with projects"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fe8e74779fde93825eb11366350d70e2f1ca0642a83f69016c043a60a7ac3c85')
b2sums=('ebce78b67fc4bc36eadc46ad3a188b12b824357c1fbe486dda974056298bdb512ab5dc61b62a1a7c4a1c7902470ea62cf3ef5d0832946e84f2b792b65c2e8a4a')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
