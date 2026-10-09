# Maintainer: Revincx <revincx233@gmail.com>

pkgname=yurigram-bin
_pkgname=yurigram
pkgver=7.3.0
pkgrel=1
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

sha256sums_x86_64=('edf6a4047c6c8c1524a201e83aaeb0903dce1b2dfbd936fcf15e705e9f0e9442')
sha256sums_aarch64=('e9fe98cd95527930101bd717d6237737162f31dec7cbc1f72f9e067ca18b8a15')

package() {

    cd "$srcdir/"

    find usr -type d -exec install -d -m755 "${pkgdir}/{}" \;

    install -m755 usr/bin/yurigram "${pkgdir}/usr/bin/yurigram"

    find usr/share -type f -exec install -m644 {} "${pkgdir}/{}" \;
}
