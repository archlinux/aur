# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>

pkgbase=python-ck
pkgname=('python-ck')
_name=ck
pkgver=2.6.4
pkgrel=1
pkgdesc='Collective Knowledge - lightweight knowledge manager to organize, cross-link, share and reuse artifacts and workflows'
arch=('any')
url='https://github.com/ctuning/ck'
license=('BSD 3-clause')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/c/ck/${_name}-${pkgver}.tar.gz)
sha256sums=('278385aaf337e15d4f7f54087853c74621b5a565253c68a96db3072ec33d0d2d')

build() {
  # build for python 3
  cd ck-$pkgver
  python setup.py build
}

package_python-ck() {
  depends=('git' 'ipython' 'python' 'python-pip')
  pkgdesc+=' for Python 3'

  cd ck-$pkgver
  python setup.py install --root=${pkgdir}/ --optimize=1
}
