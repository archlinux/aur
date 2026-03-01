pkgname=kumono-bin
pkgver=0.76.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('a66dcd66fa0ae93cc041509fd95305e76b7a4b0ef97ff4c423b6c2e93d3a9e34')
sha256sums_x86_64=('a61cbaebd389c193ff0b0f0da1bd50a4d0f5bbbca0a95f1c41af2cf68c467252')
sha256sums_aarch64=('8ff5e77193fd459a70e733a3852096efb6d5bd6475342eae369ec5158be4deed')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
