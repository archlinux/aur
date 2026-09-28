# Maintainer: Antony Kellermann <antony@aokellermann.dev>

pkgname=yaycache
pkgver=0.4.0
pkgrel=1
pkgdesc='Flexible yay cache cleaning'
arch=('any')
url='https://github.com/aokellermann/yaycache'
license=('GPL-2.0-or-later')
depends=(pacman-contrib)
makedepends=('asciidoc' 'git')
optdepends=('sudo: privilege elevation')
backup=('etc/yaycache.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('688477ca192bc6555ea40b1deb47a5f502d61f865ce04a2638fc467b75856d329f9b930935f394a7628e828882d79817c02e390d6bc4f24d5a9e656193f6aea5')

prepare() {
    cd $pkgname-$pkgver
    ./autogen.sh
}

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
