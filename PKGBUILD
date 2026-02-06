pkgname=kumono-bin
pkgver=0.69.1
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('cbdbf70a22c28054c5bd87553fff88aaa04e496ba25e90a62fa6a315ae27a0a4')
sha256sums_x86_64=('18b3eb22c825ea729d3e4248eaa5dc16d6084b5580b9540639dfa1226e19d570')
sha256sums_aarch64=('9a6427a1e6e7e1e8f78f9ef85aca810c544a4c08346ab0ee3b3c5f9f6dc0e608')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
