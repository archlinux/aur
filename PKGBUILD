# Maintainer: Letu Ren <fantasquex@gmail.com>

pkgname=python-jittor
_pkgname=jittor
pkgver=1.3.4.1
pkgrel=1
pkgdesc="Jittor is a high-performance deep learning framework based on JIT compiling and meta-operators."
arch=('x86_64')
url="https://github.com/Jittor/jittor/"
license=('APACHE')
depends=(
    'python-numpy'
    'python-tqdm'
    'python-pillow'
    'python-astunparse'
    'openmp'
)
optdepends=(
    'cuda: enable cuda'
)
makedepends=(
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b3c811e412656dc33c34c4399793be82c2d16457e5847e4d446b3f6b358c4d55')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

