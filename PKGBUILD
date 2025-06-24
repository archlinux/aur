#Maintainer: Popolon <popolon aL popolon.org>
#Made with pip2pkgbuild --pep517, then tuned

pkgname='python-manifold3d'
_module='manifold'
pkgver='3.1.1'
_src_folder="${_module}-${pkgver}"
pkgrel=2
pkgdesc="Geometry library for topological robustness"
url="https://github.com/elalish/manifold"
depends=('python' 'python-scikit-build-core' 'nanobind')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Apache Software License')
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64' 'loong64' 'powerpc' 'powerpc64le' 'powerpc64' )
source=("https://github.com/elalish/manifold/releases/download/v${pkgver}/${_module}-${pkgver}.tar.gz")
sha256sums=('5d5fcf22f2fc6c367a17226d83ced260ea61ec59e28c265cfe39a73dc6c4d1da')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
