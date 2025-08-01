pkgname=kumono-bin
pkgver=0.54.1
pkgrel=3
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64')
license=('MIT-0')
source=("kumono-$pkgver::$url/releases/download/$pkgver/kumono"
        "kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a461f7918670e7d9a2111dd9735edccd23b1f5faea2af2b1aa029ed416abc250'
            '86b526ea6e9bcc2eca6e7ddc916e230215111c4791ae3037b17d425093fff782')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver" "$pkgdir/usr/bin/kumono"
    cd "$pkgname-$pkgver"
    install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/kumono"
    install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/kumono"
}
