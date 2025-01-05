# Maintainer: hanasaki <hanasakayui2022@gmail.com>

pkgname=matcha-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="A mock chat interaction development tool"
arch=('x86_64')
url="https://github.com/A-kirami/matcha"
license=('GPL-3.0-or-later')
depends=(
    'gtk3'
    'webkit2gtk-4.1-imgpaste'
    'glibc'
    'glib2'
    'libsoup3'
    'gcc-libs'
    'cairo'
    'openssl'
    'gdk-pixbuf2'
    'hicolor-icon-theme'
)
makedepends=('binutils')
provides=('matcha')
conflicts=('matcha')
options=(!strip)
source=("$pkgname-$pkgver.deb::https://github.com/A-kirami/matcha/releases/download/v${pkgver}/matcha_${pkgver}_amd64.deb")
sha256sums=('74dd82856dce05e684e5dcbe6ab98ab23f6f4cbb3b86df70655f223cded1e62b')

package() {
    cd "$srcdir"
    ar x "$pkgname-$pkgver.deb"
    tar xf data.tar.gz -C "$pkgdir"
    rm -rf "$pkgdir/usr/src/debug"
}
