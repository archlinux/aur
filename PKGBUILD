pkgbase='python-legume-git'
pkgname=('python-legume-git')
pkgver=0.1.2.r39.g6e44e38
pkgrel=1
pkgdesc="Differentiable plane-wave and guided-mode expansion for photonic crystals"
url="https://github.com/fancompute/legume"
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib')
makedepends=('python-setuptools')
optdepends=('python-autograd: for computing gradients of all output values with respect to all input parameters')
license=('MIT')
arch=('any')
source=("git+https://github.com/fancompute/legume.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/legume"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/legume"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/legume"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
