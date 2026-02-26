# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Darius Niminenn <root at dnim dot dev>
# Contributor: Sir-Photch <sir-photch@posteo.me>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=litellm
pkgver=1.81.16
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
            'litellm-proxy-extras: proxy'
            'litellm-enterprise: proxy'
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
sha256sums=('264a3868942e722cd6c19c2d625524fe624a1b6961c37c22d299dc7ea99823b3')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
