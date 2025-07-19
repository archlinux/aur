# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115client
_name=${pkgname#python-}
pkgver=0.0.5.15.3
pkgrel=1
epoch=
pkgdesc="Python 115 webdisk client."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    python-aiohttp
    python-httpx
    python-multidict
    python-qrcode
    python-requests
    python-orjson
    python-urllib3
    python-yarl
    #AUR
    python-aiofile
    python-asynctools
    python-blacksheep
    python-cookietools
    python-dictattr
    python-ed2k
    python-encode-uri
    python-filewrap
    python-hashtools
    python-httpfile
    python-http-response
    python-http-request
    python-httpx-request
    python-iterutils
    python-iter-collect
    python-startfile
    python-p115cipher
    python-posixpatht
    python-undefined
    python-urlopen
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('514c6252cad49c8ea500b5ad18c22efab552f53e150a5f5bd3ba7c3a66346961')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
