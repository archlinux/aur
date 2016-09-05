# Maintainer: Viech <viech unvanquished net>

pkgname=python-dota2api-git
pkgver=267
pkgrel=2
pkgdesc='Dota 2 match data query API for Python.'
arch=('any')
url="https://github.com/joshuaduffy/dota2api"
license=('GPL2')
depends=('python')
makedepends=('git', 'python-setuptools')
source=("git://github.com/joshuaduffy/dota2api.git")
md5sums=('SKIP')

_gitname=("dota2api")

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

