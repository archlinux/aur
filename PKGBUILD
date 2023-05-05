pkgname=python-dm-control
pkgver=1.0.12
pkgrel=1
pkgdesc="DeepMind's software stack for physics-based simulation and Reinforcement Learning environments, using MuJoCo."
url="https://github.com/deepmind/dm_control"
license=("Apache-2.0")
arch=('x86_64')
depends=('python' 'python-absl' 'python-dm-env' 'python-dm-tree' 'python-glfw' 'python-labmaze' 'python-lxml' 'python-mujoco' 'python-numpy' 'python-protobuf' 'python-opengl' 'python-pyparsing' 'python-requests' 'python-scipy' 'python-tqdm')
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/deepmind/dm_control/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=('99d62b2ffe6378cd2f051141cc2a86707adca09d262dad0fa805640993e6840f')

build() {
    cd "${srcdir}/dm_control-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/dm_control-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
