# Maintainer: jzbor <zborof at posteo dot de>
pkgname=python-accelerate
_name=${pkgname#python-}
pkgver=0.18.0
pkgrel=1
pkgdesc="Train and use PyTorch models with multi-GPU, TPU, mixed-precision"
arch=(any)
url="https://github.com/huggingface/$_name"
license=('MIT')
groups=()
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
# checkdepends=(
#   "python-pytest"
#   "python-datasets"
#   "python-evaluate"
#   "python-transformers"
#   "python-scipy"
#   "python-scikit-learn"
#   "python-deepspeed"
#   "python-tqdm"
# )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha512sums=('828769be89aa7c474c6b622bb2a1d77d5723226081e1dbab811970930112d64fbd623b000319c6c29d36cc937cb38a2b4cd639945502815570bd01a448f0f98c')
validpgpkeys=()

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# check() {
#     cd "$_name-$pkgver"
#     pytest tests
# }
