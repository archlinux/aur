# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

_pkgname=FanFicFare
pkgname=fanficfare-git
pkgver=2.2.4.r0.g3d07257
pkgrel=2
pkgdesc="A tool for downloading fanfiction to eBook formats"
arch=('any')
url="https://github.com/JimmXinu/${_pkgname}"
license=('Apache')
depends=('python2' 'python2-beautifulsoup4' 'python2-chardet' 'python2-html5lib')
makedepends=('git')
provides=('fanficfare')
conflicts=('fanficfare')
source=("git://github.com/JimmXinu/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-
}

build() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
