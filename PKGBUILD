# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fastfetch-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="Like neofetch, but much faster because written in C."
arch=('x86_64')
url="https://github.com/LinusDierheimer/fastfetch"
license=('MIT')
depends=('sh' 'glibc')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-Linux.tar.gz")
sha256sums=('3366b60682dff32b8458cfb7f7c08040fad1df8604b9d6a9c165198371caba0f')
  
package() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}-Linux"
    cp --parents -a {etc,usr} "${pkgdir}"
    mv "${pkgdir}/usr/share/licenses/${pkgname%-bin}" "${pkgdir}/usr/share/licenses/${pkgname}"
}