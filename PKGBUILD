# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='a182661fbcc097a933d5e8cce3922eb1734a563e'
pkgname='tasknc'
pkgver='2020.02.05'
pkgrel='1'
pkgdesc="A ncurses wrapper around taskwarrior"
url="https://github.com/lharding/${pkgname}"
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('task' 'perl')
conflicts=("taskwarrior-${pkgname}-git")
source=("https://github.com/lharding/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('5b56a580eb762dd98ec2cf157a85edfeec231c64322dd9f532b2a7e9099f91f0')

build() {
    cd "${pkgname}-${_commit}"
    make
}

package() {
    cd "${pkgname}-${_commit}"
    make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
