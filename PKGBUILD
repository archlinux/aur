# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=wcurl
pkgver=2024.07.10
pkgrel=2
pkgdesc='Whenever you need to download files through the terminal and dont feel like using wget'
arch=(any)
url='https://samueloph.dev/blog/announcing-wcurl-a-curl-wrapper-to-download-files/'
license=("LicenseRef-curl")
depends=(curl sh)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Debian/wcurl/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('962bb72e36e6f6cedbd21c8ca3af50e7dadd587a49d2482ab3226e76cf6dcc97')

package() {
    cd "$srcdir/wcurl-${pkgver}"
    install -Dm755 wcurl "$pkgdir/usr/bin/wcurl"
    install -Dm644 wcurl.1 "$pkgdir/usr/share/man/man1/wcurl.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
