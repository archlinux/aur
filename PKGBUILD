#Maintainer: Popolon <popolon aL popolon.org>
#Made with pip2pkgbuild --pep517, then tuned

pkgname='python-manifold3d'
_module='manifold'
pkgver='3.2.0'
_src_folder="${_module}-${pkgver}"
pkgrel=1
pkgdesc="Geometry library for topological robustness"
url="https://github.com/elalish/manifold"
depends=('python' 'python-scikit-build-core' 'nanobind')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Apache Software License')
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64' 'loong64' 'powerpc' 'powerpc64le' 'powerpc64' )
source=("https://github.com/elalish/manifold/releases/download/v${pkgver}/${_module}-${pkgver}.tar.gz")
sha256sums=('0bca30f38ebf88a9954a90e521905d5ed36fe66b220fe4ca1cada66c2835f604')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
