# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115client
_name=${pkgname#python-}
pkgver=0.0.6.2
pkgrel=3
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
sha256sums=('50da5f2bf468d0df3f1bc5224ee72e6de3e2b1570c74ad92f832ddbc43138757')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
