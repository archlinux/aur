# Maintainer: Vladimir Navrat <vn158 at seznam dot cz>
pkgname="trilium-server-bin"
pkgver=0.47.3
pkgrel=1
pkgdesc="A hierarchical note taking application built on modern technologies (server only)."
depends=('libxss' 'nss')
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPL3')
source=("https://github.com/zadam/trilium/releases/download/v$pkgver/trilium-linux-x64-server-$pkgver.tar.xz" "${pkgname%-bin}")
OPTIONS=(!strip)

sha512sums=('afa3914baae22446146175cdedc011992e90a328d07f2e7f4d20d1a63298996bc55d153f921219380d4a7f2f0e891cf522d480d252981a8b05296455c418bb01'
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
