# Maintainer: PaladinDev <paladingames1@gmail.com>
_pkgname=TelegramGLib
pkgname=telegram-glib
_pkgver=1.0.1
pkgver=${_pkgver/-/+}
pkgrel=1
pkgdesc='Telegram bot API written in Vala'
arch=('x86_64')
url="https://github.com/SpikedPaladin/TelegramGLib"
license=('MIT')
depends=(glibc glib2 libsoup3 json-glib)
makedepends=(git meson vala valadoc gobject-introspection)
source=("https://github.com/SpikedPaladin/TelegramGLib/archive/$_pkgver.tar.gz")
sha256sums=('ce0b0c0333c66a45669a787a382c6ef6368a88aaff44a90079f8654e7756b71e')

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
