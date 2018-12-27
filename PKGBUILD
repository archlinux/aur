# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: renek <aur@spaceshore.net>

pkgname=python-aiosasl
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=2
pkgdesc="A pure python generic asyncio SASL library"
arch=('any')
url="https://github.com/horazont/aiosasl"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('060f07220f47c47736ced749d1874194efc1bb0e83e55616b2af8af3c3302650')

check() {
  cd "aiosasl-$pkgver"
  python -m nose
}

package() {
  cd "aiosasl-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ts=2 sw=2 et:
