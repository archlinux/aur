# Maintainer: Huang-Huang Bao <eh5@sokka.cn>
pkgname="fish-bash2env"
pkgver=0.1
pkgrel=1
pkgdesc='Source environment variables modified by given bash command in fish shell'
url='https://github.com/EHfive/fish-bash2env'
arch=('any')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7938f25effb1367ce10536d844cf2c41ffeebb3cd47500dba5fcb7d416355c49')
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
