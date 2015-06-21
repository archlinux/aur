_pkgname=python-frog
pkgname=${_pkgname}-git
pkgver=1
pkgrel=1
pkgdesc='Python binding for Frog, a NLP suite for Dutch containing a part-of-speech tagger, lemmatizer, morphological analyser, named entity recognition, shallow parser and dependency parser'
arch=('i686' 'x86_64')
url="https://github.com/proycon/python-frog"
license=('GPL')
depends=('python' 'frog>=0.12.20')
makedepends=('git' 'cython')
provides=("${_pkgname}")
source=("git://github.com/proycon/python-frog.git")
_gitname=("python-frog")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_gitname"
    python setup.py build_ext build 
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}

