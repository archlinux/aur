# Maintainer: mrdotx <klassiker@gmx.de>
pkgname=cinfo
pkgver=0.5.6
pkgrel=1
pkgdesc="a fast and minimal system information tool for linux-based operating systems"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/mrdotx/cinfo'
license=('GPL-3.0-or-later')
provides=('cinfo')
conflicts=('cinfo')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('59038a2261d4ab6427fea3692b750c0fac4cf8088755a4cc01bcf82d463ebc048c19832a63b741cb766282b455d5c0db4b68d6eb0e8a7740dbd15b604d498037')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
