# Use the latest stable release of this Azure SDK component.
pkgname=python-azure-ai-documentintelligence
pkgver=1.0.2
pkgrel=1
pkgdesc='Microsoft Azure AI Document Intelligence Client Library for Python'
arch=(any)
url="https://github.com/Azure/azure-sdk-for-python"
license=(MIT)
depends=(python 'python-isodate>=0.6.1' 'python-azure-core>=1.30.0' 'python-typing_extensions>=4.6.0')
makedepends=(python-build python-installer python-wheel python-setuptools)
_ref=azure-ai-documentintelligence_1.0.2
_builddir=azure-sdk-for-python-azure-ai-documentintelligence_1.0.2/sdk/documentintelligence/azure-ai-documentintelligence
source=("azure-sdk-for-python-azure-ai-documentintelligence_1.0.2.tar.gz::https://github.com/Azure/azure-sdk-for-python/archive/refs/tags/$_ref.tar.gz")
sha256sums=('2ef7568181c6c47cce53b50ccbc4e86d4fe8b444ea013c1471e92a02a9d89c9c')

build(){
 cd "$srcdir/$_builddir"
 python -m build --wheel --no-isolation
}

package(){
 cd "$srcdir/$_builddir"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -Dm644 "$srcdir/azure-sdk-for-python-azure-ai-documentintelligence_1.0.2/sdk/documentintelligence/azure-ai-documentintelligence/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
