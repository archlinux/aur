# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
# Co-maintainer : Antoine Viallon <antoine.viallon@gmail.com>
# Contributor: Lucas Rooyakkers

pkgname='python-plaidml'
_name='plaidml'
pkgver=0.7.0
pkgrel=1
pkgdesc='PlaidML machine learning accelerator'
url="https://github.com/${_name}/${_name}"
depends=('python-numpy' 'python-requests' 'python-six')
makedepends=('python-pip')
license=('Apache 2.0')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/${_name}/${_name}-$pkgver-py2.py3-none-manylinux1_x86_64.whl")
sha256sums=('b847af3d3762bc714c1b63e96f8b662b76d8742f0c87716c79e11e5612d641f8')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location *.whl
  rm -R $pkgdir/usr/lib/python*/site-packages/plaidml-*
}

