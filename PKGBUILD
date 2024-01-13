# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-jpegiptc
_name=JpegIPTC
pkgver=1.5
pkgrel=1
pkgdesc="extract APP13 (iptc data) from image and raw copy APP13 to another image"
arch=(any)
url="https://github.com/gdegoulet/JpegIPTC"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://github.com/gdegoulet/JpegIPTC/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('f5edcadd43010429b97e65a29535ce3844f50997fabd6e2eddc057136de5bcff244c89d9d911308ffaa4b5fd0da260539fe8a58e11a87a36b9a104bd68f3eb4e')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
