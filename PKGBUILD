# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_analytic_account
_name=trytond_analytic_account
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for analytic accounting"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bd745cec4e87ae0235bae7613aa10a142fb53d3243b157fb0bed44195c163683')
sha512sums=('d2dd2aba27c3824b915ccfc68f943e2a1436a679de3e5f468a82f684af637b6133fa70352155b4453baac3c60aa306402b294d2d0c5fce984bbf2d078a55f86c')
b2sums=('c9d5299bc21204f253606181a6c4ebe638f64b2c0e64e4b93cfd61da7bb2e7938892e00aa1856c1ba4eff98056acf2352b42d240724eaacfe8459f671c7265bf')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
