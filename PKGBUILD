# Maintainer: Huang-Huang Bao <eh5@sokka.cn>

pkgname='fish-bash2env'
pkgver=0.2
pkgrel=1
pkgdesc='A lightweight fish plugin to import environment variables modified by given bash command/script'
url='https://github.com/EHfive/fish-bash2env'
arch=('any')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('16814eb81286f58794f00348a57f35d2255a31374c2325d2a2f89319d33b4f28')
depends=('fish')

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
