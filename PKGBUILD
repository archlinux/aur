pkgname=python-deepspeed
pkgver=0.12.4
pkgrel=1
pkgdesc="DeepSpeed is a deep learning optimization library that makes distributed training and inference easy, efficient, and effective. "
depends=(python python-hjson ninja python-numpy python-packaging python-psutil python-py-cpuinfo python-pydantic python-pynvml python-pytorch python-tqdm)
depends+=(python-cupy python-huggingface-hub tensorboard python-transformers python-mpi4py python-tabulate python-fairscale python-safetensors)
makedepends=(python-build python-installer python-wheel)
arch=('x86_64')
url="https://github.com/microsoft/DeepSpeed"
license=('Apache-2.0')
source=("https://github.com/microsoft/DeepSpeed/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('736dbfd0ce637749899218286f13d9a932dfbbf692bdbb3ee10d988c0b945327')

build() {
  cd "${srcdir}/DeepSpeed-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/DeepSpeed-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
