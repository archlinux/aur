# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-cleantext
_name=${pkgname#python-}
pkgver=1.1.4
pkgrel=2
pkgdesc='An open-source python package to clean raw text data'
arch=(any)
url=https://pypi.org/project/cleantext
license=(MIT)
depends=(python python-nltk)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('854003de912406d8d821623774b307dc6f0626fd9fac0bdc5d24864ee3f37578')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
