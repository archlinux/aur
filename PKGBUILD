# Maintainer: mrdotx <klassiker@gmx.de>
pkgname=cinfo
pkgver=0.5.0
pkgrel=1
pkgdesc="a fast and minimal system information tool for linux-based operating systems"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'aarch64')
url='https://github.com/mrdotx/cinfo'
license=('GPL3')
provides=('cinfo')
conflicts=('cinfo')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('7fda7f287847439bd7b788ed6de24d767a2eefe01ca96aa746fd2197c933491740c1773ae49814f4a6a484d1c22157adb6b5f202a692cbe52e47263f4d8fbd8f')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
