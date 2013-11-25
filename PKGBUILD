# Contributor: Johannes Dewender  arch at JonnyJD dot net 
pkgname=python-configshell-fb
_pkgname=configshell-fb
pkgver=1.1.fb10
pkgrel=1
epoch=
pkgdesc="python framework for building simple CLI applications (free branch)"
arch=('any')
url="https://github.com/agrover/configshell-fb"
license=('Apache')
depends=('python-pyparsing' 'python-urwid')
makedepends=('python-setuptools')
provides=('python-configshell')
conflicts=('python-configshell')
options=()
source=(https://fedorahosted.org/releases/t/a/targetcli-fb/$_pkgname-$pkgver.tar.gz 2to3.patch)
md5sums=('72e152e33785bd975cc3848653d1f0bd'
         'd0413e9d1a8dca6df0c92aa9a4a2bf54')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
