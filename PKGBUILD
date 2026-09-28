# Maintainer: Kristofers Solo <aur at kristofers dot xyz>
pkgname=mekle-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Fast project discovery tool for developers (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/kristoferssolo/mekle'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=('mekle')
conflicts=('mekle' 'mekle-git')
install=mekle.install
source=("config.toml::https://raw.githubusercontent.com/kristoferssolo/mekle/v$pkgver/config/config.toml")
source_x86_64=("mekle-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/mekle-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("mekle-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/mekle-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('67eb969fc27590e942886b0860eef4cd5317dc1102f22857d42daa6fb5778393')
sha256sums_x86_64=('2df63b0ed46736c331f78649f1e6168ff8724634ad8a7fe51a32f569da12153b')
sha256sums_aarch64=('2cbcd13443a98a7cb012ef6ffe716435174027bc5d9c71ccc2da5e1a128f4c7e')

package() {
    local archive="mekle-$pkgver-$CARCH-unknown-linux-gnu"
    install -Dm755 "$archive/mekle" "$pkgdir/usr/bin/mekle"
    install -Dm644 config.toml "$pkgdir/usr/share/mekle/config.toml"
    install -Dm644 "$archive/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "$archive/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
