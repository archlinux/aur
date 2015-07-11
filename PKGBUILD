# Maintainer: David Danier <david.danier@team23.de>
pkgname=python2-gitifyhg
pkgver=0.8.4
pkgrel=1
pkgdesc="git remote that allows local development and push changes to upstream mercurial"
arch=('any')
url="https://pypi.python.org/pypi/gitifyhg/"
license=('GPL3')
groups=()
depends=('python2' 'python2-path' 'mercurial')
makedepends=('python2-distribute')
optdepends=('git: clone hg repos')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/g/gitifyhg/gitifyhg-$pkgver.tar.gz)
md5sums=('f8580e1358c794793cf223157fbcec61')

package() {
  cd "$srcdir/gitifyhg-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  # Remove "path.py" dep as this does not work with python2-path
  echo "Mercurial" > $pkgdir/./usr/lib/python*/site-packages/gitifyhg-$pkgver-py*.egg-info/requires.txt
}

# vim:set ts=2 sw=2 et:
