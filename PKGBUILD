# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Perez <tuvistavie@gmail.com>
# Contributor: AGWA
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=git-crypt
pkgver=0.5.0
pkgrel=3
pkgdesc="Transparent file encryption in Git"
arch=('i686' 'x86_64')
url="https://www.agwa.name/projects/${pkgname}/"
license=('GPL3')
depends=('git')
conflicts=("${pkgname}-git")
source=("https://github.com/AGWA/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5150144a528bc74eeb47a2884cf2fefe978a1d1dc0223bbfcac395fa6a73a410')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make ENABLE_MAN=yes PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make ENABLE_MAN=yes PREFIX=/usr DESTDIR="${pkgdir}" install
}
