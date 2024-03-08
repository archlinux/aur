# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=peirates-bin
pkgver=1.1.16
pkgrel=1
pkgdesc='Kubernetes Penetration Testing tool.'
arch=('x86_64')
url='https://github.com/inguardians/peirates'
license=('Apache 2')
provides=('peirates-bin')
source=("https://github.com/inguardians/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64.tar.xz"
        "https://raw.githubusercontent.com/inguardians/${pkgname%-bin}/v${pkgver}/LICENSE"
)
sha256sums=('d00a0e537750d339c2510b639b66ba436a23c908bfc109c68bcf6c4c95971d03'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname%-bin}-linux-amd64/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
