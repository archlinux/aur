# Maintainer: 0xjac <aur at 0xjac dot com>

pkgname=pggen-bin
pkgdesc="Generate type safe Go methods from Postgres SQL queries."
pkgver=2021.09.07
pkgrel=1
arch=('x86_64')
url="https://github.com/jschaf/pggen"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/jschaf/${pkgname%-bin}/releases/download/${pkgver//./-}/${pkgname%-bin}-linux-amd64.zip"
               "https://raw.githubusercontent.com/jschaf/${pkgname%-bin}/${pkgver//./-}/LICENSE")
sha256sums_x86_64=('2833a27c33b44fe5806377cf7c1407db6e3f6282baa2c8d7c06577d373c926ee'
                   'f55840b88fc0081b22cc24ff94fb30a0be81e3998ee05adcffa64f1188958d9d')

package() {
	install -Dm755 "${pkgname%-bin}-linux-amd64" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
