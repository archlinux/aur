# Maintainer: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>

pkgname=python-eve
_pkgname=eve
pkgver=1.1
pkgrel=1
pkgdesc="An open source Python REST API framework designed for human beings"
arch=('any')
url="http://python-eve.org/"
license=('BSD')
depends=('python-flask' 'python-simplejson' 'python-pymongo' 'python-cerberus' 'python-events')
makedepends=('python-setuptools')
conflicts=('python-eve-git')
source=("https://github.com/pyeve/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('dde409cac7af158b62c4e589145bdecc')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
