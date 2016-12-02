# Maintainer: M0Rf30

_pkgsrcname=sounddevice
pkgname=python-${_pkgsrcname}
pkgver=0.3.5
pkgrel=1
pkgdesc="Play and Record Sound with Python"
url="http://python-sounddevice.rtfd.io/"
license=("MIT")
arch=("any")
depends=('portaudio' 'python' 'python-cffi')
makedepends=('python-setuptools')
optdepends=('python-numpy: needed if you want to play back and record NumPy arrays')
source=("https://github.com/spatialaudio/python-sounddevice/archive/${pkgver}.tar.gz")

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

md5sums=('1c1b16119a10b79e4f5bd713cbbbe446')
