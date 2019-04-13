# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=schema
pkgname="python2-$_name"
pkgver=0.7.0
pkgrel=2
pkgdesc='Python module to validate and convert data structures.'
arch=(any)
url="https://github.com/keleshev/$_name"
depends=(python2 python2-contextlib2)
makedepends=(python2-setuptools)
checkdepends=(python2-mock python2-pytest)
license=(MIT)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('44add3ef9016c85ac4b0291b45286a657d0df309b31528ca8d0a9c6d0aa68186')

build() {
  cd "$_name-$pkgver"

  python2 setup.py build
}

check() {
  cd "$_name-$pkgver"

  python2 setup.py test
}

package() {
  cd "$_name-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
