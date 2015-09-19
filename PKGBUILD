# Maintainer: Adrien Oliva <yapbreak@yapbreak.fr>
pkgname="pacmanhealth"
pkgver="1.1.0"
pkgrel="1"
pkgdesc="Pacman health monitoring system"
arch=('any')
url="https://redmine.yapbreak.fr/projects/pacman-health"
license=('GPL3')
depends=('pacman' 'sed' 'coreutils' 'util-linux' 'sudo')
optdepends=('postfix: send report by mail'
            'libnotify: get desktop notification'
            'recode: get diff in html mail version')
makedepends=()
conflicts=('pacmanhealth.git')
replaces=()
backup=('etc/pacmanhealth.conf')
source=("http://release.yapbreak.fr/${pkgname}/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
# Automatically update by updpkgsums
md5sums=('4f5d37d9a841272508c8e7b241f6c967')
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
