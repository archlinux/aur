pkgname=wcurl
pkgver=2024.07.07
pkgrel=1
pkgdesc='Whenever you need to download files through the terminal and dont feel like using wget'
arch=(any)
url='https://samueloph.dev/blog/announcing-wcurl-a-curl-wrapper-to-download-files/'
license=(curl)
depends=(curl)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Debian/wcurl/archive/refs/tags/${pkgver//./-}.tar.gz")
sha256sums=('5ee1d686aeef4353cb023be341f4b34401d8c6f55039cdda5d52d47cf8db4932')

package() {
    cd "$srcdir/wcurl-${pkgver//./-}"
    install -Dm755 wcurl "$pkgdir/usr/bin/wcurl"
    gzip wcurl.1
    install -Dm644 wcurl.1.gz "$pkgdir/usr/man/man1/wcurl.1.gz"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
