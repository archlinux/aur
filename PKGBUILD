# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=canto-next
pkgname=canto-next-git
pkgver=0.9.1.r64.g4bbba6f
pkgrel=1
pkgdesc="News aggregator for Atom/RSS/RDF. Git version"
url="http://codezen.org/canto-ng/"
license=('GPL')
arch=('any')
depends=('python-feedparser')
makedepends=('git')
optdepends=('canto-curses-git: Curses interface. Git pull')
conflicts=('canto-daemon')
provides=("canto-daemon=0.9.2")
source=('git://github.com/themoken/canto-next#branch=master')
md5sums=('SKIP')


pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

package() {
    cd $srcdir/$_pkgname

    python setup.py install --prefix=/usr --root=${pkgdir} #--optimize=1
}
