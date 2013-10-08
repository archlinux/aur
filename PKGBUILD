# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=python-rtslib-fb
_pkgname=rtslib-fb
pkgver=2.1.fb40
pkgrel=1
epoch=
pkgdesc="free branch version of the LIO target API"
arch=('any')
url="https://github.com/agrover/rtslib-fb"
license=('Apache')
depends=()
# this is incompatible to python2-rtslib
provides=()
conflicts=('python2-rtslib')
backup=()
options=()
install=
source=(https://fedorahosted.org/releases/t/a/targetcli-fb/$_pkgname-$pkgver.tar.gz)
md5sums=('9cd46b0aecde0747fdd661f5f3b375e4')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  2to3 --write --nobackups --no-diffs .
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
