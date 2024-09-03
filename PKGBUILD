# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=jaxlib
pkgname=python-${_name,,}-bin
pkgver=0.4.31
pkgrel=1
pkgdesc='XLA library for JAX - binary package'
arch=('x86_64') # TODO make also aarch64 available if possible
url="https://github.com/google/jax"
license=('Apache')
provides=(python-jaxlib=${pkgver})
conflicts=(python-jaxlib)
depends=('python-absl'
         'python-flatbuffers'
         'python-ml-dtypes'
         'python-numpy'
         'python-scipy')
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-cp312-cp312-manylinux2014_x86_64.whl"
source=("https://files.pythonhosted.org/packages/b1/09/58d35465d48c8bee1d9a4e7a3c5db2edaabfc7ac94f4576c9f8c51b83e70/jaxlib-0.4.31-cp312-cp312-manylinux2014_x86_64.whl")
sha256sums=(1f1afa5fd58a60f67f0ca586e26714aece62eaa2c8334c24d0e8285afc4a7ccd)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
