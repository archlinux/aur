# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='b887688ecd1360960335a52e7b02f21dc14389a4'
pkgname='tasknc'
pkgver='2015.11.23'
pkgrel='1'
pkgdesc="A ncurses wrapper around taskwarrior"
url="https://github.com/lharding/${pkgname}"
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('task' 'perl')
conflicts=("taskwarrior-${pkgname}-git")
source=("https://github.com/lharding/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('4bcc1a4eb0774ea6aaa61ce3ad96469df453149abdf838656e4261d5eff943fd')

build() {
    cd "${pkgname}-${_commit}"
    make
}

package() {
    cd "${pkgname}-${_commit}"
    make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
