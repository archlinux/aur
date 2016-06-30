pkgbase=python-pydy-git
pkgname=('python2-pydy-git' 'python-pydy-git')
pkgver=0.3.1.r86.g1117a58
pkgrel=1

pkgdesc="Multibody dynamics toolkit for Python."
arch=('i686' 'x86_64')
url="http://www.pydy.org/"
license=('Custom: Copyright (c) 2015, PyDy Team')

makedepends=('git')

source=('git://github.com/pydy/pydy')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/pydy"
    printf "%s" "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-/./')"
}

package_python2-pydy-git() {
    depends=('python2>=2.7' 'python2-numpy>=1.8.1' 'python2-scipy>=0.13.3' 'python2-sympy>=0.7.4.1')
    optdepends=('cython2>=0.20.1' 'ipython2>=3.0.0' 'python2-theano>=0.7.0')
    provides=('python2-pydy')
    conflicts=('python2-pydy')

    cd "$srcdir/pydy"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-pydy-git() {
    depends=('python>=3.3' 'python-numpy>=1.8.1' 'python-scipy>=0.13.3' 'python-sympy>=0.7.4.1')
    optdepends=('cython>=0.20.1' 'ipython>=3.0.0' 'python-theano>=0.7.0')
    provides=('python-pydy')
    conflicts=('python-pydy')

    cd "$srcdir/pydy"
    python setup.py install --root="$pkgdir/" --optimize=1
}

