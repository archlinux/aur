# Maintainer: Nils Czernia <nils@czserver.de>
_pkgname=pws
pkgname="${_pkgname}-git"
pkgver=38745c9
pkgrel=1
pkgdesc="The pws tool allows you to store passwords in a set of encrypted files."
arch=('any')
url="https://github.com/formorer/pwstore"
depends=('ruby' 'gnupg')
source=("$pkgname::git+https://github.com/formorer/pwstore.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --always | sed 's|-|.|g'
}

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${pkgname}/pws" "${pkgdir}/usr/bin/pws"
} 
