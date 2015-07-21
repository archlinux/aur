# Maintainer: Adrien Oliva <yapbreak@yapbreak.fr>
pkgname="pacmanhealth-git"
pkgver="0.1.0.6g8da7a9b"
pkgrel="2"
pkgdesc="Pacman health monitoring system"
arch=('any')
url="https://redmine.yapbreak.fr/projects/pacman-health"
license=('GPL3')
depends=('pacman' 'sed' 'coreutils')
optdepends=('postfix: send report by mail'
            'libnotify: get desktop notification')
makedepends=()
conflicts=('pacmanhealth')
replaces=()
backup=()
source=('git://redmine.yapbreak.fr/pacmanhealth.git')
noextract=()
md5sums=('SKIP')

build() {
    cd "${srcdir}/pacmanhealth"
    ./autogen.sh
    ./configure
    make
}

package() {
    cd "${srcdir}/pacmanhealth"
    make DESTDIR="${pkgdir}/" install
}
