# Maintainer: Bruce Cutler <bruce@sumebrius.net>
pkgname=python-ffmpeg-asyncio
_pkgname='python-ffmpeg-asyncio'
pkgver=0.1.3
pkgrel=2
pkgdesc="A python interface for FFmpeg using asyncio"
arch=(any)
url="https://github.com/sumebrius/python-ffmpeg-asyncio"
license=('MIT')
options=(!emptydirs)
depends=('ffmpeg' 'python-pyee')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}::https://github.com/sumebrius/python-ffmpeg-asyncio/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dabb420e6ffc24c1667141790c7ed35a2f78ccbdcf79816e912ebaeb1f9e9d37')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
