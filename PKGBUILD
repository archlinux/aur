# Maintainer: Steffen Klee <steffen dot klee at gmail dot com>
pkgname='samsung-scantopc'
pkgver=0.6.0
pkgrel=1
pkgdesc="Tool to interact with the \"scan to PC\" option in Samsung MFP."
arch=('any')
url="https://github.com/kleest/samsung-scantopc"
license=('GPL3')
depends=('python' 'python-sane' 'python-pillow' 'python-pypdf3' 'python-six')
backup=('etc/samsungScannerServer.conf')
source=(
    "samsung-scantopc.service"
    "samsung-scantopc.sysusers"
    "samsung-scantopc.tmpfiles"
    "$pkgname-$pkgver.tar.gz::https://github.com/kleest/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)
sha512sums=('b9cda23223ecf55af66d053e369f5463c69e4e240bd5419aec128e3c54993f8103ede31744c0e0607365a8918ddf0cdba1c1a5cbf32cea4c81337e89c3ee6c66'
            '24a1a607b4bef0c132063b6564dd2a67cd51f1bec6527a96b495f14f85f3a44b1164d404c0a7314683d1ceb4578d6ab32bb65a60769788cd3465e89f15f1604d'
            '20b5e5f39eaaf9051a2c54adc7744d8c8540cf429cdf9dbd98c7a46bc24ec7cffbd5380847e32e7f5cf56df888cab88b6fec8a452c3bb31b2127b865520ee482'
            '8a4769a6b0a7c7521fda3b040c30ef575b400e7036da69231ebbe3922309d2058143b326e86090ba53d8f0330986a89208c55a1af24bcb268cec5646ec87a965')

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
}

package() {
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$pkgname-$pkgver/samsungScannerServer.py" "$pkgdir/usr/bin/samsungScannerServer.py"
    install -Dm644 "$pkgname-$pkgver/etc/samsungScannerServer.conf" "$pkgdir/etc/samsungScannerServer.conf"
    install -Dm644 "samsung-scantopc.service" "$pkgdir/usr/lib/systemd/system/samsung-scantopc.service"
    install -Dm644 "samsung-scantopc.sysusers" "$pkgdir/usr/lib/sysusers.d/samsung-scantopc.conf"
    install -Dm644 "samsung-scantopc.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/samsung-scantopc.conf"
}
