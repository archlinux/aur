# Maintainer: Vladimir Navrat <vn158 at seznam dot cz>
pkgname="trilium-server-bin"
pkgver=0.50.3
pkgrel=1
pkgdesc="A hierarchical note taking application built on modern technologies (server only)."
depends=('libxss' 'nss')
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPL3')
source=("https://github.com/zadam/trilium/releases/download/v$pkgver/trilium-linux-x64-server-$pkgver.tar.xz" "${pkgname%-bin}")
OPTIONS=(!strip)

sha512sums=('ca8fcfdda0a45425193423b7b1e874fc0c809832081779f4c26309b05bc0896d0ebe84e883ca628e1674ef5cc7025ab2ea3f603af5572e126393f727f1fcf4e5'
            '5137657683b83086e7985c1d75111b78a1760ce02e6cf8e8386477a01758fa511226de98ea4d817a52c8109116f002cdec9994e2eb5baef10fde2eaf2df42fb7')

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
