# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-115
_name=${pkgname//-/_}
pkgver=0.0.9.9
pkgrel=1
epoch=
pkgdesc="Python wrapper for 115 webdisk."
arch=('any')
url="https://pypi.org/project/python-115"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    python-httpx
    python-orjson
    python-requests
    python-rich
    python-yarl
    python-urllib3
    #AUR
    python-asynctools
    python-concurrenttools
    python-dictattr
    python-download
    python-filewrap
    python-glob-pattern
    python-hashtools
    python-httpfile
    python-httpx-request
    python-magnet2torrent
    python-iterutils
    python-texttools
    python-urlopen
    python-undefined
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('2f62a0d98cf0a3af32d478c7d73766aa7cfde17126302fcf97b01a0a0e73cf1f')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
