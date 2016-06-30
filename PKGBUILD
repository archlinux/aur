# Maintainer: Egor Panfilov <multicolor{dot}mood{at}gmail{dot}com>

pkgbase=python-hmmlearn-git
pkgname=('python2-hmmlearn-git' 'python-hmmlearn-git')
pkgver=0.2.0.r13.g3eb84fe
pkgrel=1

pkgdesc="Algorithms for unsupervised learning and inference of Hidden Markov Models for Python."
arch=('i686' 'x86_64')
url="http://hmmlearn.readthedocs.io/en/latest/"
license=('Custom: Copyright (c) 2015, hmmlearn authors and contributors')

makedepends=('git')

source=('git://github.com/hmmlearn/hmmlearn')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/hmmlearn"
  printf "%s" "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-/./')"
}

package_python2-hmmlearn-git() {
  depends=('python2>=2.6' 'python2-numpy>=1.9.3' 'python2-scipy>=0.16' 'python2-scikit-learn>=0.16')
  optdepends=('python2-matplotlib>=1.1.1: Visualization tool for examples',
              'python2-pytest>=2.6.0: Tool for running tests')
  provides=('python2-hmmlearn')
  conflicts=('python2-hmmlearn')

  cd "$srcdir/hmmlearn"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-hmmlearn-git() {
  depends=('python>=3.4' 'python-numpy>=1.9.3' 'python-scipy>=0.16' 'python-scikit-learn>=0.16')
  optdepends=('python-matplotlib>=1.1.1: Visualization tool for examples',
              'python-pytest>=2.6.0: Tool for running tests')
  provides=('python-hmmlearn')
  conflicts=('python-hmmlearn')

  cd "$srcdir/hmmlearn"
  python setup.py install --root="$pkgdir/" --optimize=1
}

