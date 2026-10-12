# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=relspec-bin
pkgver=1.0.91
pkgrel=1
pkgdesc="RelSpec is a comprehensive database relations management tool that reads, transforms, and writes database table specifications across multiple formats and ORMs."
arch=('x86_64' 'aarch64')
url="https://git.warky.dev/wdevs/relspecgo"
license=('MIT')
provides=('relspec')
conflicts=('relspec')
options=('!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/relspec_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/relspec_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('eafe45b9b94d94d9f64d3ce87c104caf552543477323b5358f75b26b45142cd7')
sha256sums_aarch64=('08b5905af1f5f42c0947844d3ffe1a42292c7386d679888fa5c73dbcb683fade')

package() {
    # Binary
    install -Dm755 "relspec" "$pkgdir/usr/bin/relspec"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Default config dir
    install -dm755 "$pkgdir/etc/relspec"
}
