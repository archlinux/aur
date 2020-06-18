# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Contributor: lazant <a.l.i.c.e at outlook.com>

pkgname=python-buildozer
_pkgname=buildozer
pkgver=1.2.0
pkgrel=1
pkgdesc="Generic Python packager for Android / iOS and Desktop"
arch=('any')
depends=('python' 'python-colorama' 'python-pexpect' 'python-virtualenv' 'python-sh')
makedepends=('cmake' 'libusb' 'python-setuptools')
optdepends=('python-paramiko: remote builds')
url="https://github.com/kivy/buildozer"
license=('MIT')
options=(!emptydirs)
source=("$_pkgname.tar.gz::https://github.com/kivy/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('01bc2868c2fceb97c33619eb4893d68f')
sha256sums=('9e7e1d86785d4228938e417fa9c7a20f85b23c85f4a8889415c781b77331a938')
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
