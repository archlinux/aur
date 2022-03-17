# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-pytorch-complex-git
pkgver=0.4.3
pkgrel=1
pkgdesc='Python class for PyTorch-ComplexTensor (workaround for missing Pytorch Class)'
arch=('any')
url='https://github.com/kamo-naoyuki/pytorch_complex'
license=('unknown')
depends=('python>=3.7' 'python-pytorch')
makedepends=('git' 'python-setuptools' 'python-pytorch' 'python-pytest' 'python-pip')
provides=('python-pytorch-complex')
conflicts=("python-pytorch-complex")
source=(
    "${pkgname}::git+${url}")
md5sums=(
    'SKIP')


pkgver() {
    cd "${pkgname}"
    printf "%s" "$(python setup.py --version)"
}


build() {
    cd "${pkgname}"
    python setup.py build
}


package() {
    cd "${pkgname}"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

