# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>

pkgname=python-pysubs2
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=2
pkgdesc='A Python library for editing subtitle files'
arch=(any)
url=https://pypi.org/project/pysubs2
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/0c/5d/ea6cb4fda284b18a034008e08650e68885cd5fca90dc17f45886ce15320d/pysubs2-$pkgver.tar.gz")
sha256sums=('6bac5307455eb1f63e1c1d696a4c4d78615765ecada83c323e28507e9bd9d887')

build() {
  cd "${srcdir}/pysubs2-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/pysubs2-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
