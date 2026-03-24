# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Darius Niminenn <root at dnim dot dev>
# Contributor: Sir-Photch <sir-photch@posteo.me>

pkgname=litellm
pkgver=1.82.6
pkgrel=1
pkgdesc='Library to easily interface with LLM API providers.'
arch=(any)
url='https://github.com/BerriAI/litellm'
license=('MIT')
depends=('python' 'python-fastuuid' 'python-httpx' 'python-openai' 'python-dotenv' 'python-tiktoken' 'python-importlib-metadata' 'python-tokenizers' 'python-click' 'python-jinja' 'python-aiohttp' 'python-pydantic' 'python-jsonschema')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
optdepends=('gunicorn: proxy'
            'uvicorn: proxy'
            'python-uvloop: proxy'
            'python-fastapi: proxy'
            'python-backoff: proxy'
            'python-pyyaml: proxy'
            'python-rq: proxy'
            'python-orjson: proxy'
            'python-apscheduler: proxy'
            'python-fastapi-sso: proxy'
            'python-pyjwt: proxy'
            'python-python-multipart: proxy'
            'python-cryptography: proxy'
            'python-pynacl: proxy'
            'python-websockets: proxy'
            'python-boto3: proxy'
            'python-azure-identity: proxy'
            'python-azure-storage-blob: proxy'
            'python-mcp: proxy'
            'python-rich: proxy'
            'python-polars: proxy'
            'python-soundfile: proxy'
            'python-pyroscope-io: proxy'
            'python-prisma: extra_proxy'
            'python-azure-identity: extra_proxy'
            'python-azure-keyvault-secrets: extra_proxy'
            'python-google-cloud-kms: extra_proxy'
            'python-google-cloud-iam: extra_proxy'
            'python-resend: extra_proxy'
            'python-redisvl: extra_proxy'
            'python-a2a-sdk: extra_proxy'
            'python-numpydoc: utils'
            'python-diskcache: caching'
            'python-semantic-router: semantic-router'
            'python-mlflow: mlflow'
            'python-grpcio: grpc'
            'python-google-cloud-aiplatform: google')
provides=("python-$pkgname")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2aa1c2da21fe940c33613aa447119674a3ad4d2ad5eb064e4d5ce5ee42420136')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
