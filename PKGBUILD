# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
_name=nicegui
pkgname=python-$_name
pkgver=3.13.0
pkgrel=1
pkgdesc='Easy-to-use, Python-based UI framework which shows up in your web browser'
arch=('any')
url='https://nicegui.io/'
license=('MIT')
depends=('python-aiofiles' 'python-aiohttp' 'python-certifi' 'python-docutils' 'python-dotenv' 'python-engineio'
         'python-fastapi' 'python-h11' 'python-httpx' 'python-idna' 'python-ifaddr' 'python-itsdangerous' 'python-jinja'
         'python-lxml' 'python-lxml-html-clean' 'python-markdown2' 'python-multipart' 'python-orjson'
         'python-pydantic-core' 'python-pygments' 'python-socketio' 'python-starlette' 'python-tinycss2'
         'python-typing_extensions' 'python-watchfiles' 'uvicorn')
makedepends=('python-build' 'python-installer' 'python-poetry-dynamic-versioning' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('340ea81a9e5e9a94365492ccde249c55e3619d05b73b60dff9424b79a264a8f6')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
