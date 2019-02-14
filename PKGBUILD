pkgname='pacaur'
pkgver=4.8.0
pkgrel=1
pkgdesc="An AUR helper that minimizes user interaction (fork)"
arch=('any')
url="https://github.com/E5ten/${pkgname}"
license=('ISC')
depends=('auracle-git' 'expac' 'sudo' 'git' 'jq')
makedepends=('perl')
backup=("etc/xdg/${pkgname}/config")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/E5ten/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4f373ba3a0cbab50ad2bbcec32e311fb9f944c273f7f3eabf944508c3d7a1c7e')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}

