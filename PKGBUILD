# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Dieter_be

_pkgbase=gensim
pkgbase=python-gensim
pkgname=('python-gensim')
pkgver=2.3.0
pkgrel=1
pkgdesc="Python framework for fast Vector Space Modelling"
arch=('i686' 'x86_64')
url="http://nlp.fi.muni.cz/projekty/gensim/"
license=('LGPL')
makedepends=('python-setuptools' 'python-scipy' 'cython' 'python-six' 'python-smart-open')
optdepends=('python-pyro')
source=("https://github.com/RaRe-Technologies/${_pkgbase}/archive/${pkgver}.tar.gz")
md5sums=('c36d7da43b1bdc175c741546300c7a41')


build() {
    unset LDFLAGS
    unset FFLAGS

    cd ${srcdir}/$_pkgbase-${pkgver//_/-}
    python setup.py build
}

package() {
    cd ${srcdir}/$_pkgbase-${pkgver//_/-}
    python setup.py install --prefix=/usr --root=${pkgdir}
}
