# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-aiplatform
_pkgname=${pkgname#python-}
pkgver=1.104.0
pkgrel=1
pkgdesc="Gemini API and Generative AI on Vertex AI"
arch=(any)
url='https://github.com/googleapis/python-aiplatform'
license=(Apache-2.0)
provides=('python-vertexai')
depends=(
  python
  python-joblib
  python-scikit-learn
  python-google-genai
  python-googleapis-common-protos
  python-numpy
  python-google-auth
  python-aiohttp
  python-sentencepiece
  python-starlette
  ipython
  python-attrs
  uvicorn
  python-pillow
  python-cloudpickle
  python-pytorch
  python-pydantic
  python-protobuf
  python-requests-toolbelt
  python-grpcio
  python-urllib3
  python-yaml
  python-pyarrow
  python-docstring-parser
  python-pandas
  python-tqdm
  python-proto-plus
  python-jinja
  python-requests
  python-typing_extensions
  tensorboard
  python-werkzeug
  python-tensorflow
  python-packaging
  python-fastapi
  python-jsonschema
  python-nest-asyncio
  python-absl
  python-google-api-core
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c20bd9df65311d2bbb22001cedaf9a486ef79f7e8a81da81abd73635ea6c77b0')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
