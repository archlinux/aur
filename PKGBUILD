# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fastfetch-bin
pkgver=1.11.3
pkgrel=1
pkgdesc="Like neofetch, but much faster because written in C."
arch=('x86_64')
url="https://github.com/LinusDierheimer/fastfetch"
license=('MIT')
depends=('sh' 'glibc')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-Linux.tar.gz")
sha256sums=('83debf7e3be8afa140bebb72df37e663c05369fa34e64126acfe2f2243b765d1')
  
package() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}-Linux"
    cp --parents -a {etc,usr} "${pkgdir}"
    mv "${pkgdir}/usr/share/licenses/${pkgname%-bin}" "${pkgdir}/usr/share/licenses/${pkgname}"
}