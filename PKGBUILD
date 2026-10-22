# Maintainer: Antony Kellermann <antony@aokellermann.dev>

pkgname=yaycache
pkgver=0.4.1
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
b2sums=('52127e11d11c0917eaf6bfa14599e0b6a3aaec420a4004f1abf79de563631705bd8a1ded5c3aa817b3c6d7568e6ca67a6ddf4b0350aef70c35e494f6e86958f3')

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
