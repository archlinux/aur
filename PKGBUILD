# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: futrime <https://github.com/futrime>

pkgname=lip
pkgver=0.24.0
pkgrel=2
pkgdesc="A general package installer"
arch=('x86_64' 'aarch64')
url="https://github.com/futrime/lip"
license=('GPL3')
conflicts=(lip-git)
source_x86_64=(
    "${pkgname}-${arch}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-linux-amd64.tar.gz"
    "lip.1"
)
source_aarch64=(
    "${pkgname}-${arch}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-linux-arm64.tar.gz"
    "lip.1"
)

sha512sums_x86_64=(
    '54c6c9ab0deb285da3734385ce9d1263557df0ddd899cfaf4ff4d3f5c2dda00af7b547ded52df08d1cac901a951f546e85c33826d545a62a8e40903cb7a32fdf'
    'fff20052a6556637965c9517f3c3d659149b9ccd6ef4d6d9336cf67c2eebbac4887e81cd36513fb415e5ad0f6fc09e1118311d4b1e62d29661bdae9275fa0f9a'
)
sha512sums_aarch64=(
    'ce7d4af91c146339175cb258ce38703db3a8c63b0927ffe63f88ca6a7963c644d9e07719c707bac6a50f3622fc456635da769a9ba0866e674539dbfd90bd83e6'
    'fff20052a6556637965c9517f3c3d659149b9ccd6ef4d6d9336cf67c2eebbac4887e81cd36513fb415e5ad0f6fc09e1118311d4b1e62d29661bdae9275fa0f9a'
)

prepare() {
    tar -xf ${pkgname}-${arch}.tar.gz
}

package() {
    install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -Dm 644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm 644 ${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
