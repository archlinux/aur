pkgname=kumono-bin
pkgver=0.66.1
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('50fb1c2a0d4e03673bcfc367f2c77f14de8d585fc5c68368e7445e155236c2ed')
sha256sums_x86_64=('dd230cee892fd77744dbaa569efd16684fcb74043db7c9c07a7a5e99a7fd8911')
sha256sums_aarch64=('4b00884e2395875111df75beb0fdcca7b04f2e4c495873fbf958859a4f0a0b61')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
