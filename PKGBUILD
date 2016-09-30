# Maintainer: Ianis G. Vasilev <mail@ivasilev.net>
pkgname=wintoggle
pkgver=3.0.2
pkgrel=1
pkgdesc="A simple window focus toggler"
arch=('x86_64' 'i386')
url="https://github.com/v--/wintoggle"
license=('Unlicense')
depends=('libx11')
makedepends=('git' 'ninja')
conflicts=('wintoggle')
provides=('wintoggle')
source=("git+https://github.com/v--/wintoggle.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
    cd "$pkgname"
    ninja
}

package() {
    cd "$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 man/wintoggle.1 "${pkgdir}/usr/share/man/man1/wintoggle.1"
    install -Dm755 wintoggle "${pkgdir}/usr/bin/wintoggle"
}
