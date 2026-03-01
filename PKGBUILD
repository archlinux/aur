pkgname=kumono-bin
pkgver=0.77.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('5b4cdf4dacb6d0145c4a21046dadbcbe77de7ae0a4527ce8c316cf7e6be9f524')
sha256sums_x86_64=('7e48065ed00614c43bf674781cd61b7668d243d6edd3fa1911d857bbb2039271')
sha256sums_aarch64=('aeb8987afad1ac6d8f7cb12d0192fec641039fa48f52f3d346ed0966874f2537')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
