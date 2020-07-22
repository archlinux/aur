# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgbase=bigjubelweb-git
pkgname=bigjubelweb-git
_module='bigjubelweb'
pkgver=0.4.2.r4.g8479a49
pkgrel=1
pkgdesc="A web interface for BigJubel"
url="https://www.kabus.eu/git/bigjubelweb"
depends=('bigjubel' 'sqlite' 'python' 'python-flask' 'python-werkzeug' 'python-yaml' 'python-click')
makedepends=('python-setuptools' 'git')
provides=('bigjubelweb')
conflicts=('bigjubelweb')
license=('GPL')
arch=('any')
source=("bigjubelweb::git://www.kabus.eu/git/bigjubelweb")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_module}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${srcdir}/${_module}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
