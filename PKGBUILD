# Maintainer: PaladinDev <paladingames1@gmail.com>
_pkgname=TelegramGLib
pkgname=telegram-glib
_pkgver=1.0.5
pkgver=${_pkgver/-/+}
pkgrel=1
pkgdesc='Telegram bot API written in Vala'
arch=('x86_64')
url="https://github.com/SpikedPaladin/TelegramGLib"
license=('MIT')
depends=(glibc glib2 libsoup3 json-glib)
makedepends=(git meson vala valadoc gobject-introspection)
source=("https://github.com/SpikedPaladin/TelegramGLib/archive/$_pkgver.tar.gz")
sha256sums=('2d8e1a38798afe4767aec62dbc7945dbfc69146860676169d28b4df85296ad43')

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
