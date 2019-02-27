pkgname='pacaur'
pkgver=4.8.4
pkgrel=1
pkgdesc='An AUR helper that minimizes user interaction'
arch=('any')
url="https://github.com/E5ten/${pkgname}"
license=('ISC')
depends=('auracle-git' 'expac' 'sudo' 'git' 'jq')
makedepends=('perl')
backup=("etc/xdg/${pkgname}/config")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/E5ten/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0b5da346d54b893896a032b4b61475d1579c996978fe882e84432ebe6ceacfa2')

build() {
    make -C "${srcdir}/${pkgname}-${pkgver}" --no-print-directory
}

package() {
    make -C "${srcdir}/${pkgname}-${pkgver}" --no-print-directory DESTDIR="${pkgdir}" PREFIX='/usr' install
}

