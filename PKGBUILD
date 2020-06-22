# Maintainer: Sam L. Yes <manjaroyes123@outlook.com>

pkgname=('powerword-bin')
_pkgname='powerword'
_dpkgname='com.kingsoft.powerword'
pkgver=1.2
pkgrel=1
pkgdesc="A Chinese-English dictionary tool."
arch=('x86_64')
url="http://www.iciba.com"
license=('custom')
groups=('')
provides=(${_pkgname} ${_dpkgname})
depends=('nss' 'openssl-1.0' 'qt4' 'libbsd' 'sdl2' 'tar')
makedepends=()
optdepends=('ttf-ms-fonts: font support')
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${_dpkgname}/${_dpkgname}_${pkgver}_amd64.deb"
        "${pkgname}.install")
md5sums=('8712bbccce4ff5eebc7f04d2c250a581'
         '7d8361adfa0c369ee5bc7ae5403d7a4c')
install="${pkgname}.install"

prepare() {
    tar -xzvf ${srcdir}/control.tar.gz -C ${srcdir}
    #tar xf ${srcdir}/data.tar.xz -C ${srcdir}
}

package() {
    install -d ${pkgdir}/opt/${_pkgname}
	install -m644 ${srcdir}/data.tar.xz ${pkgdir}/opt/${_pkgname}
    #install -d ${pkgdir}/usr/share/applications
    #install -Dm755 ${pkgdir}/opt/apps/${_dpkgname}/entries/applications/${_dpkgname}.desktop ${pkgdir}/usr/share/applications
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -m644 ${srcdir}/copyright ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
