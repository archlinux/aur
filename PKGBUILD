# Maintainer: mrdotx <klassiker@gmx.de>
pkgname=cinfo
pkgver=0.5.5
pkgrel=1
pkgdesc="a fast and minimal system information tool for linux-based operating systems"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/mrdotx/cinfo'
license=('GPL3')
provides=('cinfo')
conflicts=('cinfo')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('218d2f4ceedd83fbcd16c3f5d04d00c35c1d2a04dbf790f75cab701776be7ef1c91f63ff1a724fe68346d9472aca21093813e4fe6a147d2f98a883bd2d4d55be')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
