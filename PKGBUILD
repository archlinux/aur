# Maintainer: Revincx <revincx233@gmail.com>

pkgname=yurigram-bin
_pkgname=yurigram
pkgver=7.0.5
pkgrel=3
pkgdesc='Yet another unofficial tdesktop client'
arch=('x86_64' 'aarch64')
url="https://github.com/Revincx/Yurigram"
license=('GPL3')
provides=('yurigram')
replaces=('yukigram-rua' 'yukigram-rua-bin')
conflicts=('yurigram' 'yukigram-rua' 'yukigram-rua-bin')
depends=(
    'fontconfig'
    'freetype2'
    'glib2'
    'glibc'
    'hicolor-icon-theme'
    'libx11'
)
optdepends=('crow-translate: translation provider'
            'geoclue: geoinformation support'
            'geocode-glib-2: geocoding support'
            'webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')

source_x86_64=("$_pkgname-$pkgver-$pkgrel-x86_64.tar.gz::${url}/releases/download/$pkgver-$pkgrel/$_pkgname-$pkgver-$pkgrel-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-$pkgrel-aarch64.tar.gz::${url}/releases/download/$pkgver-$pkgrel/$_pkgname-$pkgver-$pkgrel-aarch64.tar.gz")

sha256sums_x86_64=('aef46eb4b07f0069ad85fd158b36b0b31fd3b51b5c5ba43100981c570eeacacd')
sha256sums_aarch64=('9f22b70f2335ab9957ba0a2ef4106e5a622dab608cda3f71a8f5bfdef9d16a3d')

package() {

    cd "$srcdir/"

    find usr -type d -exec install -d -m755 "${pkgdir}/{}" \;

    install -m755 usr/bin/yurigram "${pkgdir}/usr/bin/yurigram"

    find usr/share -type f -exec install -m644 {} "${pkgdir}/{}" \;
}
