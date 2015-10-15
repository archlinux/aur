# Maintainer: Egor Panfilov <multicolor{dot}mood{at}gmail{dot}com>
pkgname=python-hmmlearn-git
pkgver=0.1.1.r75.gd6dbe8c
pkgrel=1

pkgdesc="Algorithms for unsupervised learning and inference of Hidden Markov Models for Python."
arch=('i686' 'x86_64')
url="http://hmmlearn.github.io/hmmlearn/"
license=('Custom: Copyright (c) 2015, hmmlearn authors and contributors')

depends=('python' 'python-numpy>=1.6' 'python-scipy>=0.11' 'python-scikit-learn>=0.15')
makedepends=('git')

provides=('python-hmmlearn')
conflicts=('python-hmmlearn')

source=('git://github.com/hmmlearn/hmmlearn')
md5sums=('SKIP')

pkgver() {
    cd hmmlearn
    git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

package() {
    cd hmmlearn
    python setup.py install --root="$pkgdir/" --optimize=1
}

