# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mohamed Emad <hulxxv@gmail.com>
pkgname=vnstat-client
pkgver=22.5.28
pkgrel=1
pkgdesc="GUI Client for vnStat Network Monitor for Linux or GNU/Linux"
arch=('x86_64')
url="https://github.com/Hulxv/vnstat-client"
license=('MIT')
depends=('vnstat' 'electron>=15.0.0')

__filename__=${pkgname}-${pkgver}.pacman
source=("${url}/releases/download/v${pkgver}/${__filename__}")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
    tar -xJv -C "${pkgdir}" -f "${srcdir}/${__filename__}" usr opt
    mkdir "$pkgdir/usr/bin"
    ln -s /opt/vnstat-client/vnstat-client "$pkgdir"/usr/bin/vnstat-client
}
