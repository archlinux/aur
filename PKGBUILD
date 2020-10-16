# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

pkgname=python-pytorch-adabelief-git
_name=Adabelief-Optimizer
pkgver=r164.47da741
pkgrel=1
pkgdesc="PyTorch implementation of Adabelief Optimizer"
url="https://juntang-zhuang.github.io/adabelief"
license=('MIT')
arch=('any')
depends=('python-pytorch')
source=("git+https://github.com/juntang-zhuang/${_name}")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_name}/pypi_packages/adabelief_pytorch
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_name}/pypi_packages/adabelief_pytorch
  python setup.py build
}

package() {
  cd ${srcdir}/${_name}/pypi_packages/adabelief_pytorch
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
