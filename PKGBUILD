# Maintainer: derolezv <derolezv@gmail.com>
pkgname=zephyr-bin
_pkgname=zephyr
pkgver=1.2.12
pkgrel=1
pkgdesc="A modern mod manager for all your games with built-in Archipelago support."
arch=('x86_64')
url="https://github.com/Prismo-Studio/Zephyr"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$_pkgname-$pkgver.deb::https://github.com/Prismo-Studio/Zephyr/releases/download/v${pkgver}/Zephyr_${pkgver}_amd64.deb")
sha256sums=('a39f7d24065d6f815691344b55304215f123b1b1da2bff200f4a0cb8294c9742')

package() {
    cd "$srcdir"
    bsdtar -xf "$_pkgname-$pkgver.deb"
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
