# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=python2-args
_pkgname=args
pkgver=0.r37.36c727b
pkgrel=2
pkgdesc="Command Arguments for Humans."
arch=('any')
url="https://pypi.python.org/pypi/args/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname::git+https://github.com/kennethreitz/args")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  python2 setup.py install --root=$pkgdir

  install -Dm644 LICENSE \
        ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 sts=2 et:
