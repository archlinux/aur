# Maintainer: Adrien Oliva <yapbreak@yapbreak.fr>
pkgname="pacmanhealth"
pkgver="1.0.0"
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
backup=('etc/pacmanhealth.conf')
source=("http://release.yapbreak.fr/${pkgname}/${pkgname}-${pkgver}-${pkgrel}.tar.gz"
        "http://release.yapbreak.fr/${pkgname}/${pkgname}-${pkgver}-${pkgrel}.tar.gz.sig")
# Automatically update by updpkgsums
md5sums=('e18919f7563e38c1f2dde5d5b8c1ca25'
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
