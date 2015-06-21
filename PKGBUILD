_pkgname=python2-ucto
pkgname=${_pkgname}-git
pkgver=10
pkgrel=1
pkgdesc='Python binding for Ucto, an advanced tokenizer (for NLP)'
arch=('i686' 'x86_64')
url="https://github.com/proycon/python-ucto"
license=('GPL')
depends=('python2' 'ucto>=0.8.0')
makedepends=('git' 'cython2')
provides=("${_pkgname}")
source=("git://github.com/proycon/python-ucto.git")
_gitname=("python-ucto")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_gitname"
    python2 setup.py build_ext build 
}

package() {
    cd "$srcdir/$_gitname"
    python2 setup.py install --root="${pkgdir}"
}

