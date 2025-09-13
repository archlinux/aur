# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-protocol
pkgname=python-$_name
pkgver=1.0.6
pkgrel=1
pkgdesc='Python protocol stubs for LiveKit.'
arch=('any')
url='https://github.com/livekit/python-sdks/tree/main/livekit-protocol'
license=('Apache-2.0')
depends=('python' 'python-protobuf')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('b93b7f77f831b8daa853bb8619b5e256adba0c50a3d760a7ed0916f1afd5384e')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
