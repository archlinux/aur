# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=python-voila
_name=${pkgname#python-}
pkgver=0.5.5
pkgrel=1
pkgdesc="Voilà turns Jupyter notebooks into standalone web applications"
arch=(any)
url="https://github.com/voila-dashboards/voila"
license=(BSD-3-Clause)
depends=(
    python
    jupyter-server
    python-jupyterlab_server
    python-jupyter_client
    jupyter-nbclient
    jupyter-nbconvert
    jupyterlab
    python-websockets
    python-traitlets
    python-hatchling
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-jupyter_packaging
    npm
    python-fqdn
    python-webcolors
    python-isoduration
    python-jsonpointer
    python-uri-template
    python-rfc3339-validator
    python-rfc3986-validator
    python-jupyter-server-terminals
    python-hatch-jupyter-builder
    python-debugpy
    python-types-python-dateutil
    jupyter-lsp
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('a5465f2b36257a5ac4540a8513bd9a220cc75e82122cd1f7136cdfd062681d7e6849301ba0433a0c3d29679cf8d027e54b05a26da12188053eee5fa087461037')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
