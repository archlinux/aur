# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: renek <aur@spaceshore.net>

_name=aiosasl
pkgname=python-$_name
pkgver=0.5.0
pkgrel=1
pkgdesc="A pure python generic asyncio SASL library"
arch=('any')
url="https://github.com/horazont/aiosasl"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('SKIP')

check() {
  cd $_name-$pkgver
  python -m nose
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
