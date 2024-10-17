# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=jaxlib
pkgname=python-${_name,,}-bin
pkgver=0.4.34
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
source=("https://files.pythonhosted.org/packages/e7/0d/4faf839e3c8ce2a5b615df64427be3e870899c72c0ebfb5859348150aba1/jaxlib-0.4.34-cp312-cp312-manylinux2014_x86_64.whl")

sha256sums=(48272e9034ff868d4328cf0055a07882fd2be93f59dfb6283af7de491f9d1290)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
