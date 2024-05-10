# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=jaxlib
pkgname=python-${_name,,}-bin
pkgver=0.4.28
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
source=("https://files.pythonhosted.org/packages/f3/23/6f38179a0377232192e025939eea99f86239e36c74451a4ba98b6b66a8db/$_whl") # TODO: cleaner URL
sha256sums=(46a1aa857f4feee8a43fcba95c0e0ab62d40c26cc9730b6c69655908ba359f8d)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
