# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=jaxlib
pkgname=python-${_name,,}-bin
pkgver=0.4.33
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
source=("https://files.pythonhosted.org/packages/c3/03/d2bfd28e57cde716dd3729c980d450a2acd5711d50cbb9e54b23b54bc2f5/jaxlib-0.4.33-cp312-cp312-manylinux2014_x86_64.whl")

sha256sums=(054aa0f122725e000b8f8815b1794067ef2ff821588b62e1fab2a1280847f5c6)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
