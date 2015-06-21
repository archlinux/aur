_pkgname=python2-clam
pkgname=${_pkgname}-git
pkgver=1472
pkgrel=2
pkgdesc='CLAM turns command-line tools into fully RESTful webservices and also offers a modern web-based user-interface'
arch=('i686' 'x86_64')
url="http://proycon.github.io/clam"
license=('GPL')
depends=('python2' 'python2-setuptools' 'python2-lxml' 'python2-webpy' 'python2-crypto' 'python2-pycurl' 'python2-requests-oauthlib')
makedepends=('git')
provides=("${_pkgname}")
source=("git://github.com/proycon/clam")
_gitname=("clam")
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
    python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

