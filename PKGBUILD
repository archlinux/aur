# Maintainer: mrdotx <klassiker@gmx.de>
pkgname=cinfo
pkgver=0.5.7
pkgrel=1
pkgdesc="a fast and minimal system information tool for linux-based operating systems"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/mrdotx/cinfo'
license=('GPL-3.0-or-later')
provides=('cinfo')
conflicts=('cinfo')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('68daf1a734075b5813062f53b763837fa1d6a1b0b5bcaf7fadfbf144bc8139f356a3dbfae6b2ba6819ef0859b0219efbefaece25bbe044a6bf7f5ffada739ff9')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
