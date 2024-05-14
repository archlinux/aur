# Maintainer: mrdotx <klassiker@gmx.de>
pkgname=cinfo
pkgdesc='a fast and minimal system information tool for linux-based operating systems'
pkgver=0.5.10
pkgrel=1
url='https://github.com/mrdotx/cinfo'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
license=('GPL-3.0-or-later')
provides=('cinfo')
conflicts=('cinfo')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('b9d9ec609fe99d19a1317f81b4cfa820290bba50b64c0aca026169c2d53f661879ba73184b73ae499acefa50ee297ac54b05b4b4a0b5431fc9124f7e89e42f84')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
