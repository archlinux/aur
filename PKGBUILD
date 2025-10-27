# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-protocol
pkgname=python-$_name
pkgver=1.0.8
pkgrel=1
pkgdesc='Python protocol stubs for LiveKit.'
arch=('any')
url='https://github.com/livekit/python-sdks/tree/main/livekit-protocol'
license=('Apache-2.0')
depends=('python' 'python-protobuf')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('735e9b8825ccfebdcfa6db8d1a007b12db6bc1558304be803b672a504207c814')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
