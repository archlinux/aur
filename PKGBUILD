# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115client
_name=${pkgname#python-}
pkgver=0.0.5.17.1
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
sha256sums=('13e92e0f74c44b4ed6cc7485b254e71e311e6b15c1f138e4265ef9ca6a09b52e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
