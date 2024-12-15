#Maintainer: Popolon <popolon aL popolon.org>
#Made with pip2pkgbuild --pep517, then tuned

pkgname='python-manifold3d'
_module='manifold3d'
_src_folder='manifold3d-3.0.0'
pkgver='3.0.0'
pkgrel=1
pkgdesc="Library for geometric robustness"
url="None"
depends=('python' 'python-scikit-build-core' 'nanobind<=2.2.0')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Apache Software License')
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64' 'powerpc' 'powerpc64le' 'powerpc64')
source=("https://files.pythonhosted.org/packages/78/bb/504c5c256093044d2d70f74bbe314d7016701f7eaea0e76bf9468154d452/manifold3d-3.0.0.tar.gz")
sha256sums=('770402c4e83ddf78f30e48cad62f5b54432e645166f326a57d792cddbd18cd46')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
