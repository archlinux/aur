# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
# Co-maintainer: aviallon (Antoine Vaillon) <antoine.viallon@gmail.com>

pkgname='python-plaidml-keras'
_name='plaidml'
_pkgname="${_name}-keras"

pkgver=0.6.4
pkgrel=1
pkgdesc='PlaidML Keras backend implementation'
url="https://github.com/${_name}/${_name}"
depends=('python-plaidml' 'python-keras-applications' 'python-keras-preprocessing')
license=('Apache 2.0')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgname::1}/${_pkgname}/${_name}_keras-$pkgver-py2.py3-none-any.whl")
sha256sums=('81cd63754916903d392ac73eebfe02775f2dddea44331158bf33142be090682d')

package() {
  PIP_CONFIG_FILE=/dev/null pip install -U --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  rm -R ${pkgdir}/usr/lib/python*/site-packages/plaidml_*
}

