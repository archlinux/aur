# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115client
_name=${pkgname#python-}
pkgver=0.0.8.2
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
    python-qrcode
    python-orjson
    python-yarl
    #AUR
    python-argtools
    python-asynctools
    python-cookietools
    python-dictattr
    python-dicttools
    python-ed2k
    python-encode-uri
    python-ensure
    python-filewrap
    python-hashtools
    python-httpfile
    python-http-response
    python-http-request
    python-integer-tool
    python-iterutils
    python-iter-collect
    python-startfile
    python-p115cipher
    python-p115oss
    python-property
    python-posixpatht
    python-undefined
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
sha256sums=('b4d4f0facff8073390b448dca1b86a2221c250e8a10035ba0350aca4fff9fbdc')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
