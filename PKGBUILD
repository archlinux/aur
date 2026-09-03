# Maintainer: Revincx <revincx233@gmail.com>

pkgname=yurigram-bin
_pkgname=yurigram
pkgver=7.1.5
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

sha256sums_x86_64=('d017598601979aa1b70c57c29103b21910997e8dd83102d02b8f76b78022cd1e')
sha256sums_aarch64=('dc8273d433fec8b2d06cf5b35c6df048f922519824428b095ca6b27ed7474852')

package() {

    cd "$srcdir/"

    find usr -type d -exec install -d -m755 "${pkgdir}/{}" \;

    install -m755 usr/bin/yurigram "${pkgdir}/usr/bin/yurigram"

    find usr/share -type f -exec install -m644 {} "${pkgdir}/{}" \;
}
