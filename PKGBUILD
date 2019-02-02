# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
# Co-maintainer : Antoine Viallon <antoine.viallon@gmail.com>
# Contributor: Lucas Rooyakkers

pkgname='python-plaidml'
_name='plaidml'
pkgver=0.5.0
pkgrel=2
pkgdesc='PlaidML machine learning accelerator'
url="https://github.com/${_name}/${_name}"
depends=('python-numpy' 'python-requests' 'python-six')
makedepends=('python-pip')
license=('AGPL3')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/${_name}/${_name}-$pkgver-py2.py3-none-manylinux1_x86_64.whl")
sha256sums=('8f265d17084a13477f4d4f2ce38682a29af96e01ddf964e4e9f45d781eb77771')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location *.whl
  rm -R $pkgdir/usr/lib/python*/site-packages/plaidml-*
}

