# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

pkgname=python2-genson
_name=${pkgname#python2-}
pkgver=1.0.1
pkgrel=1
pkgdesc="GenSON is a powerful, user-friendly JSON Schema generator."
arch=('any')
url="https://pypi.python.org/pypi/genson"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('003218636de802d2268c167c5227b9b9110d7488f376411b3f6c6621f4bc42dc')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 ${srcdir}/${_name}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
