# Maintainer: Bruce Cutler <bruce@sumebrius.net>
pkgname=python-ffmpeg-asyncio
_pkgname='python-ffmpeg-asyncio'
pkgver=0.1.2
pkgrel=3
pkgdesc="A python interface for FFmpeg using asyncio"
arch=(any)
url="https://github.com/sumebrius/python-ffmpeg-asyncio"
license=('MIT')
options=(!emptydirs)
depends=('ffmpeg' 'python-pyee')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}::https://github.com/sumebrius/python-ffmpeg-asyncio/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fc6ce7da6ff85ebd98a2328c484aa3aa891f5f6f10e47c66b92bc9a60d61b3bb')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
