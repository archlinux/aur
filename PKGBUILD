# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=exa-py
pkgname=python-$_name
pkgver=2.5.0
pkgrel=1
pkgdesc="Python SDK for Exa API."
arch=('any')
license=('MIT')
url="https://github.com/exa-labs/exa-py"
depends=('python' 'python-requests' 'python-openai' 'python-pydantic' 'python-httpx' 'python-httpcore' 'python-dotenv')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('beb038ff671288e35ab8e6d27811b2d60cd8023c109cb0f48738258b54ed3d82')

build() {
    cd "$srcdir"/${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
