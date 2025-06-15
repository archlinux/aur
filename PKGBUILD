# Maintainer:

_pyname=fast-colorthief
pkgname=python-fast-colorthief
pkgver=0.0.5
pkgrel=1
pkgdesc='Selection of most dominant colors in image using Modified Median Cut Quantization'
arch=(x86_64)
url='https://github.com/bedapisl/fast-colorthief'
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
  python-numpy
  python-pillow
)
makedepends=(
  cmake
  python-build
  python-installer
  python-setuptools
)
source=(https://pypi.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('c943b5be73add8d3f295d3e314c9f48db8555fccc770ab09d88155ba060165ae')

build() {
  cd $_pyname-$pkgver
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  python -m build --wheel --no-isolation
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
