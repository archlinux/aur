# Maintainer: mrdotx <klassiker@gmx.de>
pkgname=cinfo
pkgver=0.5.9
pkgrel=1
pkgdesc="a fast and minimal system information tool for linux-based operating systems"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/mrdotx/cinfo'
license=('GPL-3.0-or-later')
provides=('cinfo')
conflicts=('cinfo')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('a299279f819f4aa3e0bc26aac74e5261017f8284572c5dbf052e1b55508af8c56621b46cb0bc98ec3041e6b18339bbd0124a415f5334629467af4d8d511145c8')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
