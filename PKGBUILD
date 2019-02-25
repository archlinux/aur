pkgname='pacaur'
pkgver=4.8.3
pkgrel=1
pkgdesc='An AUR helper that minimizes user interaction (fork)'
arch=('any')
url="https://github.com/E5ten/${pkgname}"
license=('ISC')
depends=('auracle-git' 'expac' 'sudo' 'git' 'jq')
makedepends=('perl')
backup=("etc/xdg/${pkgname}/config")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/E5ten/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('02356889527677e8a7b573de307a9890ba559736ab800356692a7e489e2c1242')

build() {
    make -C "${srcdir}/${pkgname}-${pkgver}" --no-print-directory
}

package() {
    make -C "${srcdir}/${pkgname}-${pkgver}" --no-print-directory DESTDIR="${pkgdir}" PREFIX='/usr' install
}

