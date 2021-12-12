# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=amdgpud-bin
pkgver=1.0.8
pkgrel=1
pkgdesc="Fan control service for AMD GPUs"
arch=('x86_64')
url="https://github.com/eraden/amdgpud"
license=('Apache' 'MIT')
provides=('amdgpud')
conflicts=('amdgpud')
backup=("etc/amdgpud/config.toml")
source=("amdgpud-amdfand-$pkgver.tar.gz::$url/releases/download/v$pkgver/amdfand.tar.gz"
        "amdgpud-amdmond-$pkgver.tar.gz::$url/releases/download/v$pkgver/amdmond.tar.gz"
        "amdgpud-amdvold-$pkgver.tar.gz::$url/releases/download/v$pkgver/amdvold.tar.gz"
        "README-$pkgver.md::$url/raw/v$pkgver/README.md"
        "LICENSE-MIT-$pkgver.md::$url/raw/v$pkgver/LICENSE.md"
        "LICENSE-APACHE-$pkgver.txt::$url/raw/v$pkgver/LICENSE.APACHE2.txt"
        "config-$pkgver.toml::$url/raw/v$pkgver/examples/default_config.toml")
sha256sums=('757ac4ab94d04164cb94f9b80b0b4218bb7351c3b870f84ea71d9e9d501d5b18'
            'e221804928190d1e30066c2e6615e36b3e5d64d3d02730b98010b3f1ffdf329a'
            '632669bbede058503e9e743dae70baaf9617327d1d12a241a71030fd5b766886'
            '233c4ff8ddd485a307371ff71ae448299b1d4a42c48378f1b6b50df09458d7a4'
            '5c5ddd7eda05a6c3dd056407a0a551230ef5a0a215332df907384ead4d13ffbf'
            '5053a909abf57ac6651ebdcbcd0768bf89426de1ba0c3a49e171a63a6656a2e2'
            'a90b8c397a4d1c9e17599b806fce7883e1f0f8b6102b97efa7dab55b682221e3')

package() {
	install -D amdfand amdmond amdvold -t "$pkgdir/usr/bin/"
	install -Dm644 {amdfand,amdmond,amdvold}.service -t "$pkgdir/usr/lib/systemd/systemd/"
	install -Dm644 "config-$pkgver.toml" "$pkgdir/etc/amdgpud/config.toml"
	install -Dm644 "LICENSE-MIT-$pkgver.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT.md"
	install -Dm644 "LICENSE-APACHE-$pkgver.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE.txt"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
