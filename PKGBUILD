# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_name=soundfile
pkgname=python-soundfile
pkgver=0.11.0
pkgrel=1
pkgdesc='A Python library to read and write audio files using libsndfile, CFFI and NumPy'
url='https://github.com/bastibe/python-soundfile'
arch=(any)
license=(BSD)
makedepends=(python-setuptools)
depends=(python-cffi libsndfile python-numpy)
source=("https://github.com/bastibe/python-soundfile/releases/download/$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('931738a1c93e8684c2d3e1d514ac63440ce827ec783ea0a2d3e4730e3dc58c18')

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  python setup.py test
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  # install license
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
