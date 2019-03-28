# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
_pythonname=mmh3
pkgname=python-${_pythonname}
pkgver=2.5.1
pkgrel=1
arch=('any')
pkgdesc="Python wrapper for MurmurHash (MurmurHash3), a set of fast and robust hash functions."
url="http://packages.python.org/${_pythonname}"
depends=('python')
license=('CC0')
source=("https://pypi.io/packages/source/m/${_pythonname}/${_pythonname}-${pkgver}.tar.gz")
sha1sums=('abe5fd3f06322fa814961fa9466ee089fa561a8a')
sha256sums=('185209a217c52afe43e079e5b232d0ef0f3a262601eaaf4371326ab6dcbec508')
sha512sums=('1cc2bdaceda00e90355fcca990517aec77e60c2117e716cf7311a5b4aa1a78635cee16ad4d551d73ea72a18fe9c40fb24b7ff042171eae252cc4fb5660592d37')

build() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

