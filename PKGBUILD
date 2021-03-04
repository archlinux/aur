# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Maintainer: Ashley Whetter <(firstname) @ awhetter.co.uk>

pkgbase=python-seqlearn-git
pkgname=('python-seqlearn-git' 'python2-seqlearn-git')
pkgver=r89.32d4bfa
pkgrel=1
pkgdesc="A sequence classification toolkit for Python."
arch=('i686' 'x86_64')
url="http://larsmans.github.io/seqlearn/"
license=('custom: Copyright 2013-2014 Lars Buitinck / University of Amsterdam and contributors')
makedepends=('git')
options=(!emptydirs)
source=(git+https://github.com/larsmans/seqlearn.git)
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/seqlearn"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python-seqlearn-git() {
  depends=('python' 'python-numpy>=1.6' 'python-scipy>=0.11' 'cython>=0.20.2')
  cd "$srcdir/seqlearn"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-seqlearn-git() {
  depends=('python2' 'python2-numpy>=1.6' 'python2-scipy>=0.11' 'cython2>=0.20.2')
  cd "$srcdir/seqlearn"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
