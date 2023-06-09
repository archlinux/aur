# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fastfetch-bin
pkgver=1.11.2
pkgrel=1
pkgdesc="Like neofetch, but much faster because written in C."
arch=('x86_64')
url="https://github.com/LinusDierheimer/fastfetch"
license=('MIT')
depends=('sh' 'glibc')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-Linux.tar.gz")
sha256sums=('ed123f2d0a766bb3e221b6897fd7db89afb0a4623c73af306336841b7987e0c5')
  
package() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}-Linux"
    cp --parents -a {etc,usr} "${pkgdir}"
    mv "${pkgdir}/usr/share/licenses/${pkgname%-bin}" "${pkgdir}/usr/share/licenses/${pkgname}"
}