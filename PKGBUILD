# Maintainer: 0xjac <aur at 0xjac dot com>

pkgname=pggen-bin
pkgdesc="Generate type safe Go methods from Postgres SQL queries."
pkgver=2022.07.16
pkgrel=1
arch=('x86_64')
url="https://github.com/jschaf/pggen"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/jschaf/${pkgname%-bin}/releases/download/${pkgver//./-}/${pkgname%-bin}-linux-amd64.tar.xz"
               "https://raw.githubusercontent.com/jschaf/${pkgname%-bin}/${pkgver//./-}/LICENSE")
sha256sums_x86_64=('92eaf7b2c16dab820e2dc3246e1259dd6ec8b6189870b510272a28ec9fcecef2'
                   'f55840b88fc0081b22cc24ff94fb30a0be81e3998ee05adcffa64f1188958d9d')

package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
