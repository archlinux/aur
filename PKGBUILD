# Maintainer: aulonsal <seraur at aulonsal dot com>
pkgname=f2-bin
pkgver=1.9.0
pkgrel=1
pkgdesc='Cross-platform command-line tool for batch renaming files and directories quickly and safely'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ayoisaiah/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver-LICENCE::${url/github/raw.githubusercontent}/v$pkgver/LICENCE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

b2sums=('1375f8eb689085b7735551ce0f5f19167df905bdf8f105ac72479ae6214666f74a03ce24766bc08a9407c878ecd8078ca3e81013ecf4fd8c80a52dc308e29d78')
b2sums_x86_64=('6f9fe6e46b6592060bda3a97e1bc9739ad99506e22810318ebfbaec7d52afc7cbb669ca796677aa729356fb457bd723c9b53f05fe79fae9a24fd22f735849887')
b2sums_i686=('02bf52df9b21aa3344f1dda3b5d9259f26235b5825ca361cd2dae5c1557bd02fa92fc5ac6504ba83bb48f43283a70bdacaf61f673a51d2e1eb5dff39ae6c715f')
b2sums_aarch64=('97a447c21c7bc1962e40ec2cc826ef3116828adec8ca8bae0d3fbcf6ad14af8757d6e3546e176e30ce8da6949c018e9290e03e217d0985ed1c2576d05b096297')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver-LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
