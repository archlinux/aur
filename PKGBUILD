pkgname=python-langsmith
pkgver=0.0.35
pkgrel=1
pkgdesc='LangSmith Client SDK Implementations '
arch=(x86_64)
url='https://github.com/langchain-ai/langsmith-sdk'
license=('MIT')
source=("https://github.com/langchain-ai/langsmith-sdk/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('84edd1de681b801ab736db5798923f9e2851f5907683358422b97870feec192f3bbf5f9f4c316253552885514a909b7ef55f45e34c2c6e9657a9894be7684f9b')
depends=(
    python-pydantic
    python-requests  
)
makedepends=(python-build python-installer python-wheel python-poetry)

build() {
    cd langsmith-sdk-$pkgver/python
    python -m build --wheel --no-isolation
}

package() {
    cd langsmith-sdk-$pkgver/python
    python -m installer --destdir="$pkgdir" dist/*.whl
}
