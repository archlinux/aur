# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=amdgpud-bin
_name=${pkgname%-bin}
pkgver=1.0.5
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
        "LICENSE-MIT-$pkgver.md::https://raw.githubusercontent.com/eraden/amdgpud/$pkgver/LICENSE.md"
        "LICENSE-APACHE-$pkgver.txt::https://raw.githubusercontent.com/eraden/amdgpud/$pkgver/LICENSE.APACHE2.txt"
        'config.toml')
sha256sums=('00a649d7a05d899876ae4f4693073969354492a4fb89d8013463d9283df015d1'
            '3a75c7074d6c4aa48fc30be607a0b6d4ffa982bbb29775fda6bcf45b1239a704'
            '89fda1599b666566728d0d3526d172548bd8d351c99c7b941be0a87ba6cc2e11'
            '5053a909abf57ac6651ebdcbcd0768bf89426de1ba0c3a49e171a63a6656a2e2'
            '708070794d89e86d307fd17009e0410adf49adc471cfcde0fdec1f217c85f0de')

package() {
	install -Dm755 amdfand -t "$pkgdir/usr/bin/"
	install -Dm644 amdfand.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 config.toml -t "$pkgdir/etc/$_name/"
	install -Dm644 "LICENSE-MIT-$pkgver.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT.md"
	install -Dm644 "LICENSE-APACHE-$pkgver.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE.txt"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
