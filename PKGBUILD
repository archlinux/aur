# Maintainer: XDwanj <xdwanj@qq.com>
pkgname="go-gsgm"
_pkgname="gsgm"
pkgver=0.1.1
pkgrel=1
pkgdesc="Gnu Single Game Manager,Linux端的游戏库管理工具,主要与 Lutris 一起使用,相辅相成,Go 版本。"
arch=(
	'x86_64' 
)
url="https://github.com/Jguer/yay"
license=('GPL-3.0')
depends=(
	'lutris>0.5.14'
)
conflicts=(
	"$pkgname"
	"$_pkgname"
)
provides=(
	"$pkgname"
	"$_pkgname"
)
source_x86_64=(
	"${pkgname}.pacman::https://github.com/XDwanj/${pkgname}/releases/download/v{$pkgver}/${pkgname}-${pkgver}-{$pkgrel}-x86_64.pkg.tar.zst"
)
sha256sums_x86_64=('546e9c46d0296038c2cda8c5cfa53098a6234de43c7b857a0121d83053f0613c')

package_x86_64() {
    cd ${srcdir}
    tar -xvf ${pkgname}-${pkgver}.pacman -C ${pkgdir}
    # Remove exsiting files
    rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL
}
