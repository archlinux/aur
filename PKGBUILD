pkgname=kumono-bin
pkgver=0.55.1
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64')
license=('MIT-0')
source=("kumono-$pkgver.elf::$url/releases/download/$pkgver/kumono"
        "kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1e9540cfc2ec52f8c126570f40b3d24409baed8d2d753c6fa10a666fcf76db8d'
            '9f1b3683b1fb35248fc64006527ef7f190a5b6d38183d40811d9fb8aee42015e')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver.elf" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
