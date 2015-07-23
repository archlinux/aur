# First Linux Arch packager: Serge Victor <arch@random.re>

pkgname=python-addict
pkgver=0.4.0
pkgrel=1
pkgdesc="A Python Dict whos keys can be set both using attribute and item syntax"
arch=('any')
makedepends=('python-setuptools')
url="https://github.com/mewwts/addict"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/a/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('cfd335fc925a0dd49ceca874219473d9')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=2 sw=2 et:
