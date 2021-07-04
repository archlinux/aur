# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=amdgpud-bin
_name=${pkgname%-bin}
pkgver=1.0.4
pkgrel=1
pkgdesc="Fan control service for AMD GPUs"
arch=('x86_64')
url="https://github.com/eraden/amdgpud"
license=('Apache' 'MIT')
provides=("$_name")
conflicts=("$_name")
backup=("etc/$_name/config.toml")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/build.tar.gz"
        "README-$pkgver.md::https://raw.githubusercontent.com/eraden/amdgpud/$pkgver/README.md"
        "LICENSE-MIT-$pkgver.md::https://raw.githubusercontent.com/eraden/amdgpud/$pkgver/LICENSE.MIT.md"
        "LICENSE-APACHE-$pkgver.md::https://raw.githubusercontent.com/eraden/amdgpud/$pkgver/LICENSE.APACHE2.md"
        'config.toml')
sha256sums=('78125c5077253b06b079157b184c3f4238c97749b23b9fd671fc9b4f5e94516e'
            '2b3ebbf4e372c27a380a571f4235b0bb611fe8068e74f09eba952ff955dbc335'
            '89fda1599b666566728d0d3526d172548bd8d351c99c7b941be0a87ba6cc2e11'
            '5053a909abf57ac6651ebdcbcd0768bf89426de1ba0c3a49e171a63a6656a2e2'
            '708070794d89e86d307fd17009e0410adf49adc471cfcde0fdec1f217c85f0de')

package() {
	install -Dm755 amdfand -t "$pkgdir/usr/bin/"
	install -Dm644 amdfand.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 config.toml -t "$pkgdir/etc/$_name/"
	install -Dm644 "LICENSE-MIT-$pkgver.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT.md"
	install -Dm644 "LICENSE-APACHE-$pkgver.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE.md"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
