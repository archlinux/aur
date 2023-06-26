pkgname=python-dm-control
pkgver=1.0.13
pkgrel=1
pkgdesc="DeepMind's software stack for physics-based simulation and Reinforcement Learning environments, using MuJoCo."
url="https://github.com/deepmind/dm_control"
license=("Apache-2.0")
arch=('x86_64')
depends=('python' 'python-absl' 'python-dm-env' 'python-dm-tree' 'python-glfw' 'python-labmaze' 'python-lxml' 'python-mujoco' 'python-numpy' 'python-protobuf' 'python-opengl' 'python-pyparsing' 'python-requests' 'python-scipy' 'python-tqdm')
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/deepmind/dm_control/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=('ed4913b6fd7851d4fee20e29183a40251cb7a16149820b15458ff1142457e997')

build() {
    cd "${srcdir}/dm_control-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/dm_control-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
