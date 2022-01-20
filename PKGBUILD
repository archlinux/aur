#Maintainer alfredjophy <at> protonmail <dot> com
pkgname=urlbrowsermapper
__name__=browser-mapper
pkgver=1.1
pkgrel=1
pkgdesc="Map hostname/ips to different browsers and profiles"
arch=('any')
url="https://github.com/AlfredEVOL/${__name__}"
license=('GPL3')
depends=('python')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b9aad19df004f14b46ce145bde8191409a82ba541d95d077a25c208c31f973e1')
package() {
    cd "${__name__}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
