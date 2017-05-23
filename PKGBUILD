# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgname=python-buildozer
_pkgname=buildozer
pkgver=0.33
pkgrel=1
pkgdesc="Generic Python packager for Android / iOS and Desktop"
arch=('any')
depends=('python' 'python-colorama' 'python-pexpect' 'python-virtualenv')
makedepends=('cmake' 'libusb' 'python-setuptools')
optdepends=('python-paramiko: remote builds')
url="https://github.com/kivy/buildozer"
license=('MIT')
options=(!emptydirs)
source=(https://github.com/kivy/$_pkgname/archive/$pkgver.tar.gz)
md5sums=('ea6b940cee6b19f39874373e3ba39790')
sha256sums=('8caaff17e4ef108f1e15feb0adb4102cbe1d83f354c94e10dfa2d32072acb380')
provides=('buildozer' 'python-buildozer')
conflicts=('buildozer')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
