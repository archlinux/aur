# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildstream
pkgver=2.7.0
pkgrel=1
pkgdesc="A powerful and flexible software integration toolset"
arch=(x86_64)
url="https://buildstream.build"
license=('Apache')
depends=(
    buildbox
    python
    python-click
    python-dateutil
    python-dulwich
    python-grpcio
    python-jinja
    python-pluginbase
    python-protobuf
    python-psutil
    python-pyroaring
    python-requests
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
source=("git+https://github.com/apache/buildstream.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd buildstream
  python setup.py build
}

package() {
  cd buildstream
  python setup.py install --root="$pkgdir/" --skip-build
}
