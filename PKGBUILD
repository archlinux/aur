# Maintainer: Vladimir Navrat <vn158 at seznam dot cz>
pkgname="trilium-server-bin"
pkgver=0.47.4
pkgrel=1
pkgdesc="A hierarchical note taking application built on modern technologies (server only)."
depends=('libxss' 'nss')
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPL3')
source=("https://github.com/zadam/trilium/releases/download/v$pkgver/trilium-linux-x64-server-$pkgver.tar.xz" "${pkgname%-bin}")
OPTIONS=(!strip)

sha512sums=('ad3627b4d57c45dcbbb027df76893523aab36281499bd31ca1cd4f97c8e1c62c23595d47370fe16cda1ca84b5423c8099171ed785f637cb2483b19df4742646c'
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
