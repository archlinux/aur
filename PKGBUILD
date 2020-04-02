# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ray
pkgver=0.8.4
pkgrel=1
pkgdesc='A fast and simple framework for building and running distributed
applications.'
arch=('x86_64')
url='https://ray.io'
license=('Apache-2.0')
depends=(psmisc python python-numpy python-filelock python-jsonschema
         python-click python-colorama python-packaging python-pytest python-pyaml
         python-redis python-six python-protobuf python-cloudpickle py-spy
         python-aiohttp python-google python-grpcio)
optdepends=(
            'python-uvicorn: for ray[serve] module'
            'python-pygments: for ray[serve] module'
            'python-werkzeug: for ray[serve] module'
            'python-flask: for ray[serve] module'
            'python-pandas: for ray[serve] module'
            'python-blist: for ray[serve] module'
            'python-tabulate: for ray[tune] and ray[rllib] module'
            'python-tensorboardx: for ray[tune] and ray[rllib] module'
            'python-atari-py: for ray[rllib] module'
            'python-dm-tree: for ray[rllib] module'
            'python-gym: for ray[rllib] module'
            'python-lz4: for ray[rllib] module'
            'python-opencv-python: for ray[rllib] module'
            'python-pyaml: for ray[rllib] module'
            'python-scipy: for ray[rllib] module'
            'python-msgpack: for ray[streaming] module'
           )
makedepends=(python python-setuptools python-wheel cython bazel)
_pkgname=ray
source=("${_pkgname}-${pkgver}::https://github.com/ray-project/ray/archive/${_pkgname}-$pkgver.tar.gz")
sha256sums=('a47d636200022f0e59defa9e9d57174a649d973a73252c354af404d7256ca203')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/python"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/python"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
