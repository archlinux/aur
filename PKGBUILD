# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgname=python-buildozer
_pkgname=buildozer
pkgver=0.35
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
md5sums=('0e09716ba6ebaa28e08423c48e98923d')
sha256sums=('af99d9fa4b065b2821b8c7dfb0c9b9aca00be28ddbbf9482fd0f48e6579d8fa1')
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
