# Maintainer: Funami
pkgname=python-pyonfx
pkgver=0.9.13
pkgrel=3
pkgdesc="An easy way to create KFX and complex typesetting for the SSA/ASS format"
arch=('any')
url="https://github.com/CoffeeStraw/PyonFX"
license=('LGPL3')
depends=('python' 'python-pyquaternion' 'python-cairo' 'python-gobject' 'pango')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
optdepends=('aegisub: open output in Aegisub support'
            'mpv: open output in mpv support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CoffeeStraw/PyonFX/archive/v$pkgver.tar.gz")
sha256sums=('7a54a23aa5856ab198b90b78b64e2f8919d763e21393e992776106a4946dfc1a')

build() {
  cd "PyonFX-$pkgver"
  python setup.py build
}

check() {
  cd "PyonFX-$pkgver"
  pytest tests/test_shape.py
}

package() {
  cd "PyonFX-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
