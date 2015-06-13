# Maintainer: Daniel YC Lin <dlin.tw at gmail>

pkgname=python2-grs-git
pkgver=v0.6.2.r0.g3a7681d
_pkgname=grs
pkgrel=1
pkgdesc="Fetch TWSE stock data"
arch=('any')
url="https://pypi.python.org/pypi/grs"
license=('custom')
depends=('python2' 'python2-dateutil')
makedepends=()

source=("$_pkgname"::git+https://github.com/toomore/grs)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
md5sums=('SKIP')
