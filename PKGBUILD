# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Darius Niminenn <root at dnim dot dev>
# Contributor: Sir-Photch <sir-photch@posteo.me>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=litellm
pkgver=1.76.0
pkgrel=1
pkgdesc='Library to easily interface with LLM API providers.'
arch=(any)
url='https://github.com/BerriAI/litellm'
license=('MIT')
depends=('python' 'python-fastuuid' 'python-httpx' 'python-openai' 'python-dotenv' 'python-tiktoken' 'python-importlib-metadata' 'python-tokenizers' 'python-click' 'python-rich' 'python-jinja' 'python-aiohttp' 'python-aioboto3' 'python-tenacity' 'python-pydantic' 'python-jsonschema' 'python-websockets')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-anyio: proxy'
            'gunicorn: proxy'
            'uvicorn: proxy'
            'python-uvloop: proxy'
            'python-fastapi: proxy'
            'python-backoff: proxy'
            'python-pyyaml: proxy'
            'python-rq: proxy'
            'python-orjson: proxy'
            'python-mangum: proxy'
            'python-apscheduler: proxy'
            'python-fastapi-sso: proxy'
            'python-pyjwt: proxy'
            'python-python-multipart: proxy'
            'python-cryptography: proxy'
            'python-pynacl: proxy'
            'python-google-cloud-aiplatform: proxy'
            'python-anthropic: proxy'
            'python-google-auth: proxy'
            'python-requests: proxy'
            'python-mcp: proxy'
            'python-google-generativeai: proxy'
            'python-async_generator: proxy'
            'python-langfuse: proxy'
            'python-prometheus_client: proxy'
            'python-ddtrace: proxy'
            'python-pillow: proxy'
            'python-azure-ai-contentsafety: proxy'
            'python-azure-keyvault: proxy'
            'python-azure-storage-file-datalake: proxy'
            'python-opentelemetry-api: proxy'
            'python-opentelemetry-sdk: proxy'
            'python-opentelemetry-exporter-otlp: proxy'
            'python-sentry_sdk: proxy'
            'python-detect-secrets: proxy'
            'python-tzdata: proxy'
            'python-google-genai: proxy'
            'python-boto3: proxy'
            'python-redis: proxy'
            'python-azure-identity: proxy'
            'python-azure-storage-blob: proxy'
            'python-mcp: proxy'
            'litellm-proxy-extras: proxy'
            'litellm-enterprise: proxy'
            'python-polars: proxy'
            'python-prisma: extra_proxy'
            'python-azure-identity: extra_proxy'
            'python-azure-keyvault-secrets: extra_proxy'
            'python-google-cloud-kms: extra_proxy'
            'python-google-cloud-iam: extra_proxy'
            'python-resend: extra_proxy'
            'python-redisvl: extra_proxy'
            'python-numpydoc: utils'
            'python-diskcache: caching'
            'python-semantic-router: semantic-router'
            'python-mlflow: mlflow')
provides=("python-$pkgname")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('d26d12333135edd72af60e0e310284dac3b079f4d7c47c79dfbb2430b9b4b421')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
