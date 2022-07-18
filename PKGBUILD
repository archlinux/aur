pkgname=python-dm-control
pkgver=1.0.4
pkgrel=1
pkgdesc="DeepMind's software stack for physics-based simulation and Reinforcement Learning environments, using MuJoCo."
url="https://github.com/deepmind/dm_control"
license=("Apache-2.0")
arch=('x86_64')
depends=('python' 'python-absl' 'python-dm-env' 'python-dm-tree' 'python-glfw' 'python-labmaze' 'python-lxml' 'python-mujoco' 'python-numpy' 'python-protobuf' 'python-opengl' 'python-pyparsing' 'python-requests' 'python-scipy' 'python-tqdm')
makedepends=('python-setuptools')
source=("https://github.com/deepmind/dm_control/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=('3159a244e87aec89c9be9a9221138600da0409954b7b2dff41e5ad0b8a1d15c9')

build() {
    cd "${srcdir}/dm_control-$pkgver"
    python setup.py build
}

package() {
    cd "${srcdir}/dm_control-$pkgver"
    python setup.py install --root "$pkgdir" --optimize=1 --skip-build
}
