# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-transformer-debugger
_pkgname=${pkgname#python-}
pkgver=0.0.0
pkgrel=1
pkgdesc='Tool for investigations into specific behaviors of small language models'
arch=('any')
url='https://github.com/openai/transformer-debugger'
license=('Apache')
groups=('openai')
depends=(
    'pre-commit'
    'python-aiohttp'
    'python-blobfile'
    'python-boostedblob'
    'python-click'
    'python-fastapi'
    'python-fire'
    'python-httpx'
    'python-numpy'
    'python-orjson'
    'python-pydantic'
    'python-scikit-learn'
    'python-starlette'
    'python-tiktoken'
    'python-torch'
    'python-uvicorn'
)
checkdepends=(
    'mypy'
    'python-pytest'
    'python-pytest-asyncio'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$pkgname-0.0.0.tar.gz::$url/archive/refs/heads/main.tar.gz")
sha256sums=('46de1870ff1ca77f1d6d5187ab58c0169e39da0164e126948aec75e20eee265d')

build() {
    python -m build -nw $srcdir/$_pkgname-main
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-main/dist/neuron_explainer-0.0.1-py3-none-any.whl
}
