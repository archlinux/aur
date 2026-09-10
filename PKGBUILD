# Maintainer: Revincx <revincx233@gmail.com>

pkgname=yurigram-bin
_pkgname=yurigram
pkgver=7.2.7
pkgrel=2
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

sha256sums_x86_64=('000ebf5b7cb5b81a30bbd833406143cfcd22896a6144cd64fda73867c4ec31fc')
sha256sums_aarch64=('7242b36a06153a3a1d8e33d52d50a0c81d8b2bb97bfee84ace3e387f815b64c1')

package() {

    cd "$srcdir/"

    find usr -type d -exec install -d -m755 "${pkgdir}/{}" \;

    install -m755 usr/bin/yurigram "${pkgdir}/usr/bin/yurigram"

    find usr/share -type f -exec install -m644 {} "${pkgdir}/{}" \;
}
