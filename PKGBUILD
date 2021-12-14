# Maintainer: Simon Boulay <simon.boulay@alkeona.net>
# Contributor: Melvin Vermeeren <mail@mel.vin>

_name=sphinxcontrib-tikz
pkgname=("python-${_name}")
pkgver=0.4.15
pkgrel=1
pkgdesc="TikZ extension for Sphinx."
arch=('any')
url="https://bitbucket.org/philexander/tikz"
license=('BSD')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('27f9a7a6a64f1bf3ea4dd0e963b7da7c7778948856c8d557a71d64ace086519f')

prepare() {
  cp -a "sphinxcontrib-tikz-$pkgver" "sphinxcontrib-tikz2-$pkgver"
}

package_python-sphinxcontrib-tikz() {
  depends=('python' 'python-setuptools')

  cd "sphinxcontrib-tikz-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
