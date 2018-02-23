# Maintainer: nano thirteen <nano13@gmx.net>

_pkgname=('presage')
pkgname=('presage-git')
pkgver=926
pkgrel=1
pkgdesc='Presage is an intelligent predictive text entry platform.'
arch=('any')
licence=('GPL')
url='http://presage.sourceforge.net'
makedepends=('git' 'automake' 'make' 'gcc')
depends=('sqlite')
source=('git+https://git.code.sf.net/p/presage/presage')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

package() {
    cd "$srcdir"/"$_pkgname"
    
    autoreconf -fvi
    autoconf
    
    ./configure
    make
    make DESTDIR="$pkgdir" install
}
