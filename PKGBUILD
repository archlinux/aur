pkgname='pacaur'
pkgver=4.8.1
pkgrel=1
pkgdesc='An AUR helper that minimizes user interaction (fork)'
arch=('any')
url="https://github.com/E5ten/${pkgname}"
license=('ISC')
depends=('auracle-git' 'expac' 'sudo' 'git' 'jq')
makedepends=('perl')
backup=("etc/xdg/${pkgname}/config")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/E5ten/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3b030991a9141835a2650e5627556185f191a513b294061af1a7537a7a3ea77e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX='/usr' install
}

