# Maintainer: mrdotx <klassiker@gmx.de>
pkgname=cinfo
pkgver=0.5.2
pkgrel=2
pkgdesc="a fast and minimal system information tool for linux-based operating systems"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/mrdotx/cinfo'
license=('GPL3')
provides=('cinfo')
conflicts=('cinfo')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('c9b8d912dd7077030d3dfde99ca4185ddd9d2405972a7f6314791251cebe084cbd08ad088bbc9be2c0dc85b7301fcce6bd53a38824fbcf2991caa616197dfa2f')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
