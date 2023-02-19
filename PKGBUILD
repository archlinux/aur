# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname='pdd'
pkgname="${_pkgname}-git"
pkgver=r148.3def901
pkgrel=1
pkgdesc='Tiny date, time diff calculator with piggybacked timers.'
arch=('any')
url='https://github.com/jarun/pdd'
license=('GPL3')
depends=('python' 'python-dateutil')
makedepends=('git' 'python-setuptools')
provides=("pdd")
conflicts=("pdd")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
