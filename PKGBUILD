# Maintainer: Magi3r <magier dot mit dot f3erball at gmail dot com>
pkgname=python-model2vec
pkgver=0.7.0
pkgrel=1
pkgdesc="Fast State-of-the-Art Static Embeddings"
arch=("any")
url="https://github.com/MinishLab/model2vec"
license=('MIT')
depends=(
    'python'
    'python-jinja'
    'python-joblib'
    'python-numpy'
    'python-rich'
    'python-safetensors'
    'python-tokenizers'
    'python-tqdm'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'git'
)
source=("$pkgname-$pkgver::git+https://github.com/MinishLab/model2vec.git#tag=v$pkgver")
sha256sums=('47e153fa53e0baaf9c4bfbc8540c12e32585615df39be963037fdc78caf6debb')


build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
