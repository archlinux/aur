_pkgname=python-folia
pkgname=${_pkgname}-git
pkgver=479
pkgrel=2
pkgdesc='Command line tools for dealing with the FoLiA format (Format for Linguistic Annotation).'
arch=('i686' 'x86_64')
url="https://proycon.github.io/folia"
license=('GPL')
depends=('python' 'python-setuptools' 'python-lxml' 'python-pynlpl-git')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("python2-folia")
source=("git://github.com/proycon/folia.git")
_gitname=("folia")
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
    python setup.py install --prefix=/usr --root="${pkgdir}"
}

