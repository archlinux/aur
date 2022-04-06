# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgname=python-ly-git
pkgver=0.9.7.r1.gf24b840
pkgrel=1
pkgdesc="Python modules to parse, manipulate or create documents in LilyPond format."
arch=('any')
url="https://github.com/frescobaldi/python-ly"
license=('GPL')
makedepends=('git')
depends=('python')
provides=("${pkgname%-git}=$pkgver-$pkgrel")
conflicts=("${pkgname%-git}" "ly")
options=(!emptydirs)
source=("$pkgname"::'git+https://github.com/frescobaldi/python-ly.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
