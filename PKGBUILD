# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Perez <tuvistavie@gmail.com>
# Contributor: AGWA
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/git-crypt-git

pkgname=git-crypt
pkgver=0.4.2
pkgrel=2
pkgdesc="Transparent file encryption in Git"
arch=('i686' 'x86_64')
url="https://www.agwa.name/projects/${pkgname}/"
license=('GPL3')
depends=('git')
provides=("$pkgname")
conflicts=("${pkgname}-git")
source=("https://github.com/AGWA/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ac363ded67b1f08d1d460a56782346cbdc6e6171d3390e3f5d3290940eb6ad86')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
