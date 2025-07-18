# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-blingfire
pkgname=python-${_name}
pkgver=1.0.0
pkgrel=2
pkgdesc='BlingFire bindings for livekit-agents.'
arch=('any')
_repo='https://github.com/livekit/agents'
url="${_repo}/tree/main/livekit-plugins/livekit-blingfire"
license=('Apache-2.0')
source=("${_repo}/archive/refs/tags/${_name//-blingfire/-agents}@1.1.5.tar.gz")
sha256sums=('a3a6631e23125a6c11f51fef5bf74f6ab7b1a31bbb7e5547b5fe49018664dbdb')
depends=('python')
makedepends=('python-setuptools' 'pybind11' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/agents-${_name//-blingfire/-agents}-1.1.5/livekit-plugins/${_name}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/agents-${_name//-blingfire/-agents}-1.1.5/livekit-plugins/${_name}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
