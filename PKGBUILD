# Maintainer: Antony Kellermann <antony@aokellermann.dev>

pkgname=yaycache
pkgver=0.3.4
pkgrel=1
pkgdesc='Flexible yay cache cleaning'
arch=('x86_64')
url='https://github.com/aokellermann/yaycache'
license=('GPL')
depends=(pacman-contrib)
makedepends=('asciidoc' 'git')
optdepends=('sudo: privilege elevation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('825a717e96e2d2bcd75f5db7e11decbbb2cc3f467b5d4978ec321262aa13ab3ea10b06fdee0f8d8778ab9274966fbe5e4bb5079ccd87d7a6da7b9e98f5e3be77')

prepare() {
    cd $pkgname-$pkgver
    ./autogen.sh
}

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

check() {
    cd $pkgname-$pkgver
    make check
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
