# Maintainer: dringsim <dringsim@qq.com>

pkgname=python-bilix
_name="${pkgname#python-}"
pkgver=0.18.9
pkgrel=1
pkgdesc="Lightning-fast asynchronous download tool for bilibili and more"
arch=(any)
url="https://github.com/HFrost0/bilix"
license=('Apache-2.0')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python-aiofiles' 'python-anyio' 'python-danmakuc' 'python-beautifulsoup4'
    'python-click' 'python-httpx' 'python-json5' 'python-m3u8'
    'python-pycryptodome' 'python-pycryptodome' 'python-rich' 'python-browser-cookie3'
    'python-pymp4')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8ab1be9bcc661369cbeba95439c09716778b6b42b2505a3eaddb45175688e247')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

