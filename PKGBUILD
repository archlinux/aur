# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Perez <tuvistavie@gmail.com>
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/git-crypt-git

pkgname=git-crypt
pkgver=0.4
pkgrel=1
pkgdesc="Transparent file encryption in Git"
arch=('i686' 'x86_64')
url="http://www.agwa.name/projects/${pkgname}/"
license=('GPL3')
depends=('git' 'openssl')
provides=("{$pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/AGWA/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8825200a353ba9fe5f972c67e2ca4f1e7194cd3ad369ba14fddb1ba840dc2140')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    mkdir "${pkgdir}/bin"
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install
}
