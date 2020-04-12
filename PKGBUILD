# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
# Co-maintainer: aviallon (Antoine Vaillon) <antoine.viallon@gmail.com>

pkgname='python-plaidml-keras'
_name='plaidml'
_pkgname="${_name}-keras"

pkgver=0.7.0
pkgrel=1
pkgdesc='PlaidML Keras backend implementation'
url="https://github.com/${_name}/${_name}"
depends=('python-plaidml' 'python-keras-applications' 'python-keras-preprocessing')
license=('Apache 2.0')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgname::1}/${_pkgname}/${_name}_keras-$pkgver-py2.py3-none-any.whl")
sha256sums=('e49cc34d47a6eec6acca8a6bf5ac7af6a8172e333d422ffac8c85846d8521bbc')

package() {
  PIP_CONFIG_FILE=/dev/null pip install -U --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  rm -R ${pkgdir}/usr/lib/python*/site-packages/plaidml_*
}

