# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115client
_name=${pkgname#python-}
pkgver=0.0.8.9.2
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
    python-cachedict
    python-concurrenttools
    python-cookietools
    python-dictattr
    python-dicttools
    python-download
    python-ed2k
    python-encode-uri
    python-ensure
    python-errno2
    python-filewrap
    python-glob-pattern
    python-hashtools
    python-httpfile
    python-http-response
    python-http-request
    python-id2dirnode
    python-integer-tool
    python-iterdir
    python-iterutils
    python-iter-collect
    python-sqlitetools
    python-startfile
    python-p115cipher
    python-p115pickcode
    python-p115oss
    python-property
    python-posixpatht
    python-temporary
    python-undefined
    python-urllib3-request
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
sha256sums=('973fe81e2773be756517bc446b1c493bb264f1632ec26927fdb3a0b57bd66158')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
