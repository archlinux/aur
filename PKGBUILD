# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_edocument_uncefact
_name=trytond_edocument_uncefact
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgdesc="Tryton module for electronic document UN/CEFACT"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2dd6dc04faa465b4aaf1e4c4aeaecd6e8f5a0b8b21aec9bea5344955fd2fbf8a
8594f20d37ca0a7912405497d63006a4fc514f99dc15f7fecba14acafd4d1a0a')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
