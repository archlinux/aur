pkgname=kumono-bin
pkgver=0.56.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64')
license=('MIT-0')
source=("kumono-$pkgver.elf::$url/releases/download/$pkgver/kumono"
        "kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('77fb761fba78d24e42c42443471c18e4dc90c00fa67f0a4c91e8d777cf2c22a8'
            '6672d5dd9f14dce468f54ad01ee8213a644fa4259e671fa410ca369bec8a9af2')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver.elf" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
