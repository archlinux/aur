# Maintainer: 0xjac <aur at 0xjac dot com>

pkgname=pggen-bin
pkgdesc="Generate type safe Go methods from Postgres SQL queries."
pkgver=2022.02.05
pkgrel=1
arch=('x86_64')
url="https://github.com/jschaf/pggen"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/jschaf/${pkgname%-bin}/releases/download/${pkgver//./-}/${pkgname%-bin}-linux-amd64.zip"
               "https://raw.githubusercontent.com/jschaf/${pkgname%-bin}/${pkgver//./-}/LICENSE")
sha256sums_x86_64=('72ff349e76d64ebbf7d0cbc412a48b091b1b37f9530b5ca2081ecf61f1283897'
                   'f55840b88fc0081b22cc24ff94fb30a0be81e3998ee05adcffa64f1188958d9d')

package() {
	install -Dm755 "${pkgname%-bin}-linux-amd64" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
