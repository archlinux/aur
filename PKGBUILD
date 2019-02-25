# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
_pkgname=pytest-describe
pkgname=python-$_pkgname
pkgver=0.12.0
pkgrel=1
pkgdesc="Describe-style plugin for pytest"
arch=('any')
url="https://github.com/ropez/pytest-describe"
license=('Apache')
depends=('python-pytest')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('569bda96401fe512f4f345f33fd23fa4d718639d42afac62bc03254b5f2b3fdf')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
