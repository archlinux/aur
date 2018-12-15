# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
_pkgname=pytest-describe
pkgname=python-$_pkgname
pkgver=0.11.1
pkgrel=1
pkgdesc="Architectural foundation for Python applications"
arch=('any')
url="https://github.com/ropez/pytest-describe"
license=('Apache')
depends=('python-pytest')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bd6be131452b7822c872735ffe53ce3931b3b80cbbad1647c2b482cc9ef3d00e')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
