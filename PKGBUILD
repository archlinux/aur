# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >

pkgname='python-tensorflow2'
_name='tensorflow'
pkgver="2.0.0b1"
_py=cp37
pkgrel=1
pkgdesc='An end-to-end open source machine learning platform (beta)'
url="https://www.${_name}.org"
depends=('python-numpy')
makedepends=('python-pip')
optdepends=('tensorboard')
provides=('python-tensorflow')
license=('Apache')
arch=('x86_64')
#source=("https://files.pythonhosted.org/packages/py3/${_name::1}/${_name}/${_name}-${_ver}-cp37-cp37m-manylinux1_x86_64.whl")
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-${_py}m-manylinux1_x86_64.whl")
sha256sums=('9e8f0f4801eab024618684281b9d5f990f963bb1b872cf84e341fc5d73283fb7')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location *.whl
  rm -rf "${pkgdir}"/usr/bin/tensorboard
}
