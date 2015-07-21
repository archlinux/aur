# Maintainer: Adrien Oliva <yapbreak@yapbreak.fr>
pkgname="pacmanhealth"
pkgver="0.1.1"
pkgrel="1"
pkgdesc="Pacman health monitoring system"
arch=('any')
url="https://redmine.yapbreak.fr/projects/pacman-health"
license=('GPL3')
depends=('pacman' 'sed' 'coreutils')
optdepends=('postfix: send report by mail'
            'libnotify: get desktop notification')
makedepends=()
conflicts=('pacmanhealth.git')
replaces=()
backup=()
source=("http://release.yapbreak.fr/${pkgname}/${pkgname}-${pkgver}-${pkgrel}.tar.gz"
        "http://release.yapbreak.fr/${pkgname}/${pkgname}-${pkgver}-${pkgrel}.tar.gz.sig")
# TODO
md5sums=('9356a5f43211a8e28c3d3bb5e5c037a0'
         'SKIP')
noextract=()

build() {
    cd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}
    ./configure
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}
    make DESTDIR="${pkgdir}/" install
}
