# Maintainer: Revincx <revincx233@gmail.com>

pkgname=yurigram-bin
_pkgname=yurigram
pkgver=7.0.1
pkgrel=1
pkgdesc='Yet another unofficial tdesktop client, but forked from yukigram'
arch=('x86_64')
url="https://github.com/Revincx/Yukigram"
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

sha256sums=('3e0dfdce8e316a403200d868f1119f916f58781de7087c0b1d8829b738cd5092')

package() {

    cd "$srcdir/"

    find usr -type d -exec install -d -m755 "${pkgdir}/{}" \;

    install -m755 usr/bin/yurigram "${pkgdir}/usr/bin/yurigram"
    install -m755 usr/bin/yurigram-launcher "${pkgdir}/usr/bin/yurigram-launcher"

    find usr/share -type f -exec install -m644 {} "${pkgdir}/{}" \;
}
