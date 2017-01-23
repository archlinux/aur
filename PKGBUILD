# Maintainer: Alexandre Magno <alexandre.mbm@gmail.com>
pkgname=comporg
pkgver=0.2.0
pkgrel=1
_forker=ENE
pkgdesc="Manage and organize your electronic components, datasheets and application notes"
url="https://github.com/${_forker}/${pkgname}"
arch=('x86_64')
license=('GPLv3')
depends=('qt4')
source=("https://github.com/${_forker}/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('bf5418423adbf2650b0fc6acbbb58075')

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    lrelease ${pkgname}.pro || return 1
    qmake-qt4 || return 1
    make || return 1
    #make DESTDIR="${pkgdir}/" install
    install -Dm755 _build/release/bin/comporg_unix ${pkgdir}/usr/bin/${pkgname}
}

