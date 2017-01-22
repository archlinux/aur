# Maintainer: Alexandre Magno <alexandre.mbm@gmail.com>
pkgname=comporg
pkgver=0.1.0
pkgrel=1
_forker=ENE
pkgdesc="Manage and organize your electronic components, datasheets and application notes"
url="https://github.com/${_forker}/${pkgname}"
arch=('x86_64')
license=('GPLv3')
depends=('qt4')
source=("https://github.com/${_forker}/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('7cc2925a1ffec927ac619570e2f1470e')

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake-qt4 || return 1
    make || return 1
    #make DESTDIR="${pkgdir}/" install
    install -Dm755 _build/release/bin/comporg_unix ${pkgdir}/usr/bin/${pkgname}
}

