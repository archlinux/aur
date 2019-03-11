pkgname=python-nvidia-ml-py3-git
_module='nvidia-ml-py3'
pkgver=r5.2b04f5d
pkgrel=1
pkgdesc="Python 3 Bindings for the NVIDIA Management Library"
url="https://github.com/nicolargo/nvidia-ml-py3"
depends=(python)
makedepends=(python-setuptools)
license=('custom')
arch=('any')
source=("git://github.com/nicolargo/nvidia-ml-py3.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_module"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_module}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

