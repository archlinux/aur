# Maintainer: Fabio Zanini <fabio.zanini _at_ fastmail.fm>
_pypiname=kaldi_io
pkgname=python-kaldi-io
pkgver=0.9.1
pkgrel=1
pkgdesc="Python functions for reading kaldi data formats. Useful for rapid prototyping with python."
arch=('any')
url="http://pypi.python.org/project/${_pypiname}"
license=('Apache')
depends=('python' 'python-numpy')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pypiname:0:1}/${_pypiname}/${_pypiname}-$pkgver.tar.gz")
md5sums=('2ec3668346699cffd2bb59d881adeb59')

build() {
  cd "${srcdir}/${_pypiname}-$pkgver"
  python setup.py build
}

package() {
  cd ${_pypiname}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
