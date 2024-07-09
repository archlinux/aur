# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildstream
pkgver=2.2.1
pkgrel=1
pkgdesc="A powerful and flexible software integration toolset"
arch=(x86_64)
url="https://buildstream.build"
license=('Apache')
depends=(
    buildbox-common
    python
    python-click
    python-dateutil
    python-grpcio
    python-jinja
    python-pluginbase
    python-protobuf
    python-psutil
    python-pyroaring
    python-ruamel-yaml
    python-ruamel.yaml.clib
    python-setuptools
    python-ujson
    # specific host site dependencies
    bzip2 gzip lzip tar xz
)
optdepends=(
    "buildstream-plugins: Official BuildStream plugins like “git”"
    "buildstream-plugins-container: Official BuildStream plugin for Docker images"
    "buildstream-plugins-experimental: Official experimental BuildStream plugins"
)
makedepends=(cython git python-packaging)
source=("git+https://github.com/apache/buildstream.git#tag=${pkgver}&commit=aba6eff09b133e140fba961ede14a984b2e236c7")
sha256sums=('SKIP')

build() {
  cd buildstream
  python setup.py build
}

package() {
  cd buildstream
  python setup.py install --root="$pkgdir/" --skip-build
}
