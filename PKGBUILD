# Maintainer: fkobayashi <see name left ＠ 数学 (but in english) dot ubc.ca

pkgname=python-lapsolver
_pkgname=lapsolver # PyPI name
pkgver=1.1.0
pkgrel=1
pkgdesc="Fast linear assignment problem solvers"
arch=('any')
license=('MIT')
url="https://github.com/cheind/py-lapsolver"
depends=(python python-setuptools cmake)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e438689e528f18b801d996f10d158554050618a89ffff6b562a97ba41cfd37ed')


build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --prefix=/usr --root $pkgdir || return 1

  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
