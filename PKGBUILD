# Maintainer: Revincx <revincx233@gmail.com>

pkgname=yurigram-bin
_pkgname=yurigram
pkgver=7.0.4
pkgrel=1
pkgdesc='Yet another unofficial tdesktop client'
arch=('x86_64')
url="https://github.com/Revincx/Yurigram"
license=('GPL3')
provides=('yurigram')
replaces=('yukigram-rua' 'yukigram-rua-bin')
conflicts=('yurigram' 'yukigram-rua' 'yukigram-rua-bin')
depends=('glibc' 'fontconfig' 'glib2' 'hicolor-icon-theme' 'libx11' 'freetype2')
optdepends=('geoclue: geoinformation support'
            'geocode-glib-2: geocoding support'
            'webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')

source=("$_pkgname-$pkgver-$pkgrel-x86_64.tar.gz::${url}/releases/download/$pkgver-$pkgrel/$_pkgname-$pkgver-$pkgrel-x86_64.tar.gz")

sha256sums=('40afdc4d3b5a7a826cab73a99962ef531e47cf0ebc66bc59f064a3526e39a467')

package() {

    cd "$srcdir/"

    find usr -type d -exec install -d -m755 "${pkgdir}/{}" \;

    install -m755 usr/bin/yurigram "${pkgdir}/usr/bin/yurigram"

    find usr/share -type f -exec install -m644 {} "${pkgdir}/{}" \;
}
