# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
# Co-maintainer : Antoine Viallon <antoine.viallon@gmail.com>
# Contributor: Lucas Rooyakkers

pkgname='python-plaidml'
_name='plaidml'
pkgver=0.6.4
pkgrel=1
pkgdesc='PlaidML machine learning accelerator'
url="https://github.com/${_name}/${_name}"
depends=('python-numpy' 'python-requests' 'python-six')
makedepends=('python-pip')
license=('Apache 2.0')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/${_name}/${_name}-$pkgver-py2.py3-none-manylinux1_x86_64.whl")
sha256sums=('9ae55eded885cbcd48e1a9482a23b1afa54c5963555c1d732da11e7a0b4f9f6c')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location *.whl
  rm -R $pkgdir/usr/lib/python*/site-packages/plaidml-*
}

