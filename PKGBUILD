# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Contributor: lazant <a.l.i.c.e at outlook.com>

pkgname=python-buildozer
_pkgname=buildozer
pkgver=1.0
pkgrel=1
pkgdesc="Generic Python packager for Android / iOS and Desktop"
arch=('any')
depends=('python' 'python-colorama' 'python-pexpect' 'python-virtualenv' 'python-sh')
makedepends=('cmake' 'libusb' 'python-setuptools')
optdepends=('python-paramiko: remote builds')
url="https://github.com/kivy/buildozer"
license=('MIT')
options=(!emptydirs)
source=("https://github.com/kivy/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('8677f67448c450d84529d81fdae6d7c4')
sha256sums=('7c4eba8e09aa0aff35cbf0a6859ad027121165a814e5cac8d2ad1d1ce1b8febd')
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
