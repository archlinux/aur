# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fastfetch-bin
pkgver=1.12.2
pkgrel=1
pkgdesc="Like neofetch, but much faster because written in C."
arch=('x86_64')
url="https://github.com/LinusDierheimer/fastfetch"
license=('MIT')
depends=('sh' 'glibc')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-Linux.tar.gz")
sha256sums=('07c5fc2eed32b4d8cf64034825a34378002e6d3ab85571d585d0f0c29e4c38d7')
  
package() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}-Linux"
    cp --parents -a {etc,usr} "${pkgdir}"
    mv "${pkgdir}/usr/share/licenses/${pkgname%-bin}" "${pkgdir}/usr/share/licenses/${pkgname}"
}