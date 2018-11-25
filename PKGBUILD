# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgname=python-buildozer
_pkgname=buildozer
pkgver=0.36
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
md5sums=('2ceefb2dce7a1ed7ee36975d5e680ecb')
sha256sums=('dbdae8c6752b18bee4af6afd12244901174a0bcef271f9c7881ac99a5103e54c')
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
