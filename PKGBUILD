# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
# Contributor: Lucas Rooyakkers

pkgname='python-plaidml'
_name='plaidml'
pkgver=0.3.5
pkgrel=2
pkgdesc='PlaidML machine learning accelerator'
url="https://github.com/${_name}/${_name}"
depends=('python-numpy' 'python-requests' 'python-six')
makedepends=('python-pip')
license=('AGPL3')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/${_name}/${_name}-$pkgver-py2.py3-none-manylinux1_x86_64.whl")
sha256sums=('7df944bdde540fe11e4ec00a402f10a93ed57b0faaf6cb7311acacbf86e955fc')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location *.whl
  rm -R $pkgdir/usr/lib/python*/site-packages/plaidml-*
}

