#Maintainer: Popolon <popolon aL popolon.org>
#Made with pip2pkgbuild --pep517, then tuned

pkgname='python-manifold3d'
_module='manifold'
pkgver='3.0.1'
_src_folder="${_module}-${pkgver}"
pkgrel=2
pkgdesc="Geometry library for topological robustness"
url="https://github.com/elalish/manifold"
depends=('python' 'python-scikit-build-core' 'nanobind<=2.2.0')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Apache Software License')
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64' 'loong64' 'powerpc' 'powerpc64le' 'powerpc64' )
source=("https://github.com/elalish/manifold/releases/download/v${pkgver}/${_module}-${pkgver}.tar.gz")
sha256sums=('a691f4aaf5745c2ced9969cbaeab139d972b37a07f689707667adc44ded9b595')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
