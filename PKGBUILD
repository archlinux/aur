# Maintainer: Tim Diels <timdiels.m@gmail.com>

_pkgname=plumbum
pkgname=python-plumbum-git
pkgver=v1.5.0.r275.gab08669
pkgrel=1
pkgdesc="Shell combinators library."
arch=('any')
url="http://pypi.python.org/pypi/plumbum"
license=('GPL')
makedepends=('git')
depends=('python' 'python-six')
source=("git+https://github.com/tomerfiliba/plumbum.git")
options=(!emptydirs)
md5sums=(SKIP)
conflicts=(python-plumbum)
provides=(python-plumbum)

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${_pkgname}"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
