# Contributor: Pieter Lenaerts <pieter dot aj dot lenaerts gmail>

pkgname=python-jpegtran-cffi-git
pkgver=v0.5.2.r26.gfd24034
pkgrel=1
pkgdesc='Fast, (mostly) lossless JPEG transformations with Python'
arch=('any')
url='https://github.com/jbaiter/jpegtran-cffi'
license=('MIT')
source=('git+https://github.com/jbaiter/jpegtran-cffi.git')
md5sums=('SKIP')
makedepends=('python-setuptools' 'git')
provides=('python-jpegtran-cffi')
conflicts=('python-jpegtran-cffi')
depends=('libjpeg-turbo' 'python-cffi')

pkgver() {
  cd jpegtran-cffi
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir"/jpegtran-cffi
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
