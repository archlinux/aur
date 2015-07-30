# Maintainer: Adrien Oliva <yapbreak@yapbreak.fr>
pkgname="pacmanhealth-git"
pkgver="1.0.0.1"
pkgrel="1"
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
backup=('etc/pacmanhealth.conf')
source=('git+https://redmine.yapbreak.fr/pacmanhealth.git')
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
