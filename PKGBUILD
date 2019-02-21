pkgname='pacaur'
pkgver=4.8.2
pkgrel=1
pkgdesc='An AUR helper that minimizes user interaction (fork)'
arch=('any')
url="https://github.com/E5ten/${pkgname}"
license=('ISC')
depends=('auracle-git' 'expac' 'sudo' 'git' 'jq')
makedepends=('perl')
backup=("etc/xdg/${pkgname}/config")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/E5ten/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ac95600d35f8472127e2cc02f6fe449560f26e3d12136483053953c206b583a3')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX='/usr' install
}

