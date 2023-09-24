# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildstream
pkgver=2.1.0
pkgrel=1
pkgdesc="A powerful and flexible software integration toolset"
arch=(x86_64)
url="https://buildstream.build"
license=('Apache')
depends=(
    buildbox-casd
    buildbox-fuse
    buildbox-run-bubblewrap
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
source=("git+https://github.com/apache/buildstream.git#tag=2.1.0&commit=171e3a85e897f03ee8b05307366de1f2123fcfdf")
sha256sums=('SKIP')

build() {
  cd buildstream
  python setup.py build
}

package() {
  cd buildstream
  python setup.py install --root="$pkgdir/" --skip-build
}
