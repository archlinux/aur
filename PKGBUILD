# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildstream
pkgver=2.0.0
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
    python-setuptools
    python-ujson
    # specific host site dependencies
    bzip2 gzip lzip tar xz
)
makedepends=(cython git python-packaging)
source=("git+https://github.com/apache/buildstream.git#tag=2.0.0&commit=f27bc3bed2bdbb3dfd72fdbfa59a7607d74123a7")
sha256sums=('SKIP')

build() {
  cd buildstream
  python setup.py build
}

package() {
  cd buildstream
  python setup.py install --root="$pkgdir/" --skip-build
}
