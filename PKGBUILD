# Maintainer: Ianis G. Vasilev <ianis@ivasilev.net>
pkgname=wintoggle-git
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
source=('git://github.com/v--/wintoggle.git')
sha256sums=('SKIP')

build() {
    cd wintoggle
    make wintoggle
}

package() {
    cd wintoggle
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 man/wintoggle.1 "${pkgdir}/usr/share/man/man1/wintoggle.1"
    install -Dm755 wintoggle "${pkgdir}/usr/bin/wintoggle"
}
