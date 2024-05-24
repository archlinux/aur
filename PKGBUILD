# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=python-voila
_name=${pkgname#python-}
pkgver=0.5.7
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
b2sums=('d59f7fc34c2c216f1027b628ceefbefcab3869fb748752906f68aba95945de1ebdf041f34ca50fc9ad0e37872c7e1a518b86ba41a349c7c5e3ab12c5dd9a5e93')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
