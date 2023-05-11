# Maintainer: Maurizio D'Addona <mauritiusdadd at gmail dot com>

pkgname=python-sewpy-git
pkgver=r87.67e36b7
pkgrel=3
pkgdesc="Python interface to SExtractor"
arch=('any')
url="http://sewpy.readthedocs.io/en/latest"
license=('GPL3')
provides=('python-sewpy')
conflicts=('python-sewpy')
depends=('python' 'python-astropy' 'astromatic-sextractor')
makedepends=('python-setuptools'  'python-wheel' 'git')
source=("git+https://github.com/megalut/sewpy.git")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/sewpy"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/sewpy"
  python setup.py build
}

package(){
  cd "$srcdir/sewpy"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
