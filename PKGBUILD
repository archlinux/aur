# Bamboo - A Vietnamese Input method editor
# Copyright (C) 2018 Luong Thanh Lam <ltlam93@gmail.com>

pkgname=bamboo-ibus-git
_pkgname=ibus-bamboo
pkgver=0.7.0
pkgrel=1
pkgdesc='A Vietnamese IME for IBus'
arch=('any')
license=('GPL3')
url="https://github.com/BambooEngine/ibus-bamboo"
conflicts=('ibus-bamboo')
depends=('ibus')
makedepends=('git' 'go' 'libx11' 'libxtst' 'make')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "%s" "$(awk -F '=' '/^version/ {print $2}' Makefile)"
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
}
