# Maintainer: Ianis G. Vasilev <ianis@ivasilev.net>
pkgname=wintoggle
pkgver=3.0.3
pkgrel=1
pkgdesc="A simple window focus toggler"
arch=('x86_64' 'i386')
url="https://github.com/v--/wintoggle"
license=('Unlicense')
depends=('libx11')
makedepends=('make')
conflicts=('wintoggle')
provides=('wintoggle')
source=("https://github.com/v--/wintoggle/archive/v$pkgver.tar.gz")
sha256sums=('0d841c3774e35c7a8fcfcfa87d93dd28f5cf19fe07c2305aa89f13d519d79cd7')

build() {
    tar --gunzip --extract --file v$pkgver.tar.gz
    cd "$pkgname-$pkgver"
    make wintoggle
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 man/wintoggle.1 "${pkgdir}/usr/share/man/man1/wintoggle.1"
    install -Dm755 wintoggle "${pkgdir}/usr/bin/wintoggle"
}
