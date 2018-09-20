# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >

pkgname='python-plaidml-keras'
_name='plaidml'
_pkgname="${_name}-keras"

pkgver=0.3.5
pkgrel=1
pkgdesc='PlaidML Keras backend implementation'
url="https://github.com/${_name}/${_name}"
depends=('python-plaidml' 'python-keras-applications' 'python-keras-preprocessing')
license=('AGPL3')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgname::1}/${_pkgname}/${_name}_keras-$pkgver-py2.py3-none-any.whl")
sha256sums=('a7836dc3fc24a29cb28e0e36b846a5131c5171494fd41be8514bcb8d33f90b19')

package() {
  PIP_CONFIG_FILE=/dev/null pip install -U --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  rm -R ${pkgdir}/usr/lib/python*/site-packages/plaidml_*
}

