# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=python-aioopenssl
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc="A pure python generic asyncio SASL library"
arch=('any')
url='https://github.com/horazont/aioopenssl'
license=('LGPL3')
depends=('python'
         'python-pyopenssl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('baa1e7f6e41882b8b3ea8ead8146352e9c4329accb529125868bd36d61aa7c1f')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
