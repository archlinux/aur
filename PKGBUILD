# Maintainer: Vladimir Navrat <vn158 at seznam dot cz>
pkgname="trilium-server-bin"
pkgver=0.43.4
pkgrel=1
pkgdesc="A hierarchical note taking application built on modern technologies (server only)."
depends=('libxss' 'nss')
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPL3')
source=("https://github.com/zadam/trilium/releases/download/v$pkgver/trilium-linux-x64-server-$pkgver.tar.xz" "${pkgname%-bin}")
sha512sums=('a7efef3dfdfaec3393b5b292ec69f57813070e2245c8e0c77c7d538efe570bef0a30156c4aa660104036c977326957052bdffb21a860f8996a2ce1e760ef1840'
            '758b923c312ff039a2653d9743e5f3d5bb74f57f83c0fc837a4d17f263437c419d3bd975d86f2067e80dbb579b6599fea428edd3ead47d25b09765cf5f54174c')

package()
{
    # Make folders for extraction
    mkdir -p "$pkgdir/opt/${pkgname%-bin}"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    # Move main files
    mv trilium-linux-x64-server/* "$pkgdir/opt/${pkgname%-bin}"
    # Create command and make it executable
    cp "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    chmod 0755 "$pkgdir/usr/bin/${pkgname%-bin}"
}
