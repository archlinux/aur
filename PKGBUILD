pkgname=kumono-bin
pkgver=0.55.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64')
license=('MIT-0')
source=("kumono-$pkgver.elf::$url/releases/download/$pkgver/kumono"
        "kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a8f36908e262abdcc49a3e64ae997d69fd44c28f25196e697f28021b242285c7'
            '2414897d54038847ef9c5e0139cd3c5b67376cd22a1d780c9be165c22b66b51b')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver.elf" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
