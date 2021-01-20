# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-beets
_name=Mopidy-Beets
pkgver=4.0.1
pkgrel=2
pkgdesc="Mopidy extension for playing music from a Beets collection"
arch=('any')
url='https://mopidy.com/ext/beets/'
license=('MIT')
depends=(
	'mopidy>=3'
	'python-pykka>=2.0.1'
	'python-setuptools'
	'python-requests>=2')
makedepends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6a3310f12da35bd737763ffbe7bab2301ad8340d74470d222817d2c39ba2a0d1')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
