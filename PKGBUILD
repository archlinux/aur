# Maintainer: Revincx <revincx233@gmail.com>

pkgname=yukigram-rua-bin
_pkgname=yukigram-rua
pkgver=6.9.3
pkgrel=1
pkgdesc='Yet another unofficial tdesktop client, but forked from yukigram'
arch=('x86_64')
url="https://github.com/Revincx/Yukigram"
license=('GPL3')
provides=('yukigram-desktop' 'yukigram-rua')
conflicts=('yukigram-desktop' 'yukigram-rua')
depends=('glibc' 'fontconfig' 'glib2' 'hicolor-icon-theme' 'libx11' 'freetype2')
optdepends=('geoclue: geoinformation support'
            'geocode-glib-2: geocoding support'
            'webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')

source=("$_pkgname-$pkgver-$pkgrel-x86_64.tar.gz::${url}/releases/download/$pkgver-$pkgrel/$_pkgname-$pkgver-$pkgrel-x86_64.tar.gz")

sha256sums=('19fe75512df910cf99b3e859ea75079bd129e2e7ba3c239dafe6add122e02c2f')

package() {

    cd "$srcdir/"

    find usr -type d -exec install -d -m755 "${pkgdir}/{}" \;

    install -m755 usr/bin/yukigram "${pkgdir}/usr/bin/yukigram"

    find usr/share -type f -exec install -m644 {} "${pkgdir}/{}" \;
}
