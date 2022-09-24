# Maintainer: Marco Galli <marco dot galli at proton dot me>
# Contributor: Heinrich Zander <heinrichl dot zander at gmail dot com>
pkgname=lorien-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Infinite canvas drawing/whiteboarding app"
arch=('x86_64')
url="https://github.com/mbrlabs/Lorien"
license=('MIT')
depends=('libxcursor'
	 'libxinerama'
	 'libxext'
	 'libxrandr'
	 'libxrender'
	 'libx11'
	 'libxi'
	 'libgl'
	 'libxfixes'
	 'libxcb'
	 'libxau'
	 'libxdmcp')

conflicts=('lorien-git')
source=("${url}/releases/download/v${pkgver}/Lorien_${pkgver}_Linux.tar.xz"
        "${pkgname%-bin}.png"
        "${pkgname%-bin}.desktop")

sha256sums=('ea8820088b07ed3bc79121de8dffbcc1cd4402990af663b0c2c62718d2585658'
            'fcdd491ea3fa4e3ea0c43b15f2c3b92974f550c97abe5b081ac1cab614612851'
            '635c0be1607f406b4c51ab3f7b1d55c7c0f8fcfeddbe68a54723817cd6bda60f')

package() {
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps/"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications/"

    install -Dm755 "${srcdir}/Lorien_${pkgver}_Linux/Lorien.x86_64" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/Lorien_${pkgver}_Linux/Lorien.pck" "${pkgdir}/usr/bin/${pkgname%-bin}.pck"
}
