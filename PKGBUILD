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
sha256sums=('544d0c59d4019785eefb704fdb4ea2ff8a91d25886c74d0c2493b92f960536ce')

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
