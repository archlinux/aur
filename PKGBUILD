# Maintainer: Marco Galli <marco dot galli at proton dot me>
# Contributor: Heinrich Zander <heinrichl dot zander at gmail dot com>
pkgname=lorien-bin
pkgver=0.6.0
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
source=("${url}/releases/download/v${pkgver}/Lorien_v${pkgver}_Linux.tar.xz"
        "${pkgname%-bin}.png"
        "${pkgname%-bin}.desktop"
        "LICENSE")

sha256sums=('e2bba60eb94c305a896b65c869d297e6644fe7a8056eb2baf5c79797141e8388'
            'fcdd491ea3fa4e3ea0c43b15f2c3b92974f550c97abe5b081ac1cab614612851'
            '635c0be1607f406b4c51ab3f7b1d55c7c0f8fcfeddbe68a54723817cd6bda60f'
            'd6fb6cb94d65232165d84e7ed8ec2b3c4ccc9a3d98256547f9bd9dce23fcc39f')

package() {
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps/"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm755 "${srcdir}/Lorien_v${pkgver}_Linux/Lorien.x86_64" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/Lorien_v${pkgver}_Linux/Lorien.pck" "${pkgdir}/usr/bin/${pkgname%-bin}.pck"
}
