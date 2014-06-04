# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Perez <tuvistavie@gmail.com>
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/git-crypt-git

pkgname=git-crypt
pkgver=0.3
pkgrel=2
pkgdesc="Transparent file encryption in Git"
arch=('i686' 'x86_64')
url="http://www.agwa.name/projects/${pkgname}/"
license=('GPL3')
depends=('git' 'openssl')
provides=("{$pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/AGWA/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6b2a03d28240c06ce4c06c3fc73ecd88f61b638e42f8534a9f2d1dbd17132755')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    mkdir "${pkgdir}/bin"
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install
}
