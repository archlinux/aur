# Maintainer: PaladinDev <paladingames1@gmail.com>
_pkgname=TelegramGLib
pkgname=telegram-glib
_pkgver=1.0.7
pkgver=${_pkgver/-/+}
pkgrel=1
pkgdesc='Telegram bot API written in Vala'
arch=('x86_64')
url="https://github.com/SpikedPaladin/TelegramGLib"
license=('MIT')
depends=(glibc glib2 libsoup3 json-glib)
makedepends=(git meson vala valadoc gobject-introspection)
source=("https://github.com/SpikedPaladin/TelegramGLib/archive/$_pkgver.tar.gz")
sha256sums=('79bd88f8b2b297042b28c16fb7be413efd9bbe5e0e2fc1ab2a256f79ac6d691a')

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
