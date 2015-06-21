_pkgname=python-pynlpl
pkgname=${_pkgname}-git
pkgver=1324
pkgrel=2
pkgdesc='Python Natural Language Processing Library (pronounce as: pineapple). Contains various modules useful for common, and less common, NLP tasks. Includes full FoLiA library.'
arch=('i686' 'x86_64')
url="https://github.com/proycon/pynlpl"
license=('GPL')
depends=('python' 'python-setuptools' 'python-lxml' 'python-httplib2' 'python-numpy')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("python-pynlpl")
source=("git://github.com/proycon/pynlpl.git")
_gitname=("pynlpl")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_gitname"
    python setup.py build
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --prefix=usr/ --root="${pkgdir}"
}

