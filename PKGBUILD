_pkgname=cyberdrop_dl_patched
pkgname=cyberdropdownloader
pkgver=10.12.1
pkgrel=1
pkgdesc="Bulk asynchronous downloader for multiple file hosts"
arch=('any')
url="https://github.com/Cyberdrop-DL/cyberdrop-dl"
license=('GPL-3.0-only')
depends=(
    python-aiohappyeyeballs
    python-aiohttp
    python-aiolimiter
    python-aiosqlite
    python-async-mega.py
    python-beautifulsoup4
    python-brotli
    python-certifi
    python-curl_cffi
    python-cyclopts
    python-idna
    python-imagesize
    python-m3u8
    python-markdown
    python-multidict
    python-propcache
    python-psutil
    python-pycparser
    python-pycryptodome
    python-pydantic
    python-questionary
    python-rich
    python-rich-rst
    python-send2trash
    python-soupsieve
    python-typing_extensions
    python-wassima
    python-wcwidth
    python-xxhash
    python-yaml
)
makedepends=(
    python-build
    python-installer
    python-uv-build
    python-wheel
)
optdepends=(
    'apprise: Notifications to other services'
    'flaresolverr: A proxy server to bypass Cloudflare protection'
    'python-lxml: Faster HTML parsing'
)
conflicts=('cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('1f6f8dd96c8b6f03b2146e6d2bc0473138f065b51d66e2b7e532457ef0e36890')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
