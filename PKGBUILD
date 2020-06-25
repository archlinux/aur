# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ray
pkgver=0.8.6
pkgrel=1
pkgdesc='A fast and simple framework for building and running distributed
applications.'
arch=('x86_64')
url='https://ray.io'
license=('Apache-2.0')
depends=(psmisc python python-aiohttp python-click python-colorama
         python-filelock python-google python-grpcio python-jsonschema
         python-msgpack python-numpy python-protobuf py-spy python-pyaml
         python-redis)
optdepends=(
            'python-requests: for ray[dashboard] module'
            'python-gpustat: for ray[dashboard] module'
            'uvicorn: for ray[serve] module'
            'python-flask: for ray[serve] module'
            'python-blist: for ray[server] module'
            'python-tabulate: for ray[tune] and ray[rllib] module'
            'python-tensorboardx: for ray[tune] and ray[rllib] module'
            'python-pandas: for ray[tune] and ray[rllib] module'
            'python-atari-py: for ray[rllib] module'
            'python-dm-tree: for ray[rllib] module'
            'python-gym: for ray[rllib] module'
            'python-lz4: for ray[rllib] module'
            'python-opencv-python: for ray[rllib] module'
            'python-pyaml: for ray[rllib] module'
            'python-scipy: for ray[rllib] module'
            'python-msgpack: for ray[streaming] module'
           )
makedepends=(python python-setuptools python-wheel python-pip cython bazel)
_pkgname=ray
source=("${_pkgname}-${pkgver}::https://github.com/ray-project/ray/archive/${_pkgname}-$pkgver.tar.gz")
sha256sums=('c0366e3911f6b4f9eec1aae7969c12882df9bcf408bbcdc1fceb18f3b303543c')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/python"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/python"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
