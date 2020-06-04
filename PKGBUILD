#Maintainer: Liam Timms <timms5000@gmail.com>

_pkgname=etelemetry
pkgname=python-$_pkgname
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="Etelemetry python client API"
url="https://github.com/sensein/etelemetry-client"
arch=('any')
license=('apache')
depends=('python-ci-info')
provides=("python-etelemetry")
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/6e/35/e684ac76f9044b888d9d1961e93e38c9b12bfb4f6d2eaf17329109b8e770/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bfb58f58e98f63eae20caffb8514fb68c572332aa6e773cf3fcbde9b408d88e7')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

