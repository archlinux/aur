# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-protocol
pkgname=python-$_name
pkgver=1.1.26
pkgrel=1
pkgdesc='Python protocol stubs for LiveKit.'
arch=('any')
url='https://github.com/livekit/python-sdks/tree/main/livekit-protocol'
license=('Apache-2.0')
depends=('python' 'python-protobuf')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('de8d291abb2efd026fbe23394ee4c05358195f09102d3c13335978ba04d7bdb8')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
