# Maintainer: PaladinDev <paladingames1@gmail.com>
_pkgname=TelegramGLib
pkgname=telegram-glib
_pkgver=1.0.2
pkgver=${_pkgver/-/+}
pkgrel=1
pkgdesc='Telegram bot API written in Vala'
arch=('x86_64')
url="https://github.com/SpikedPaladin/TelegramGLib"
license=('MIT')
depends=(glibc glib2 libsoup3 json-glib)
makedepends=(git meson vala valadoc gobject-introspection)
source=("https://github.com/SpikedPaladin/TelegramGLib/archive/$_pkgver.tar.gz")
sha256sums=('db747103b03b558f64647d16e71513f8a6b7ef9f3a76ff90dc3fe517b334dc53')

prepare() {
    cd "$_pkgname-$_pkgver"
}

build() {
    cd "$_pkgname-$_pkgver"
    arch-meson build
    ninja -C build
}

package() {
    cd "$_pkgname-$_pkgver"
    DESTDIR="${pkgdir}" ninja -C build install
}
