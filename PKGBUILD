_pkgname=python2-folia
pkgname=${_pkgname}-git
pkgver=479
pkgrel=3
pkgdesc='Command line tools for dealing with the FoLiA format (Format for Linguistic Annotation).'
arch=('i686' 'x86_64')
url="https://proycon.github.io/folia"
license=('GPL')
depends=('python2' 'python2-setuptools' 'python2-lxml' 'python2-pynlpl-git')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("python-folia")
source=("git://github.com/proycon/folia.git")
_gitname=("folia")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_gitname"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_gitname"
    python2 setup.py install --prefix=/usr --root="${pkgdir}"
}

