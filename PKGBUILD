# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgname=python-pyosf
_pkgname=pyosf
pkgrel=1
pkgver=1.0.5
pkgdesc="A pure python library for simple sync with Open Science Framework"
depends=('python' 'python-requests')
makedepends=('python-setuptools')
url="https://github.com/psychopy/pyosf"
license=('MIT')
arch=('any')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('5afac9a27e869f274dba276fe00fdecc')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 "The MIT License (MIT).md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
