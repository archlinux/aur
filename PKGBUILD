# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Roman G <drakosha@au.ru>

pkgname=torrentinfo
pkgver=1.8.7
pkgrel=1
pkgdesc="Bittorrent .torrent file parser and summariser"
arch=('any')
url="https://github.com/Fuuzetsu/torrentinfo"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=("git+$url#commit=3c9b3ba80c867ba28e8ce0982fec8ea5369df8ef")
b2sums=('SKIP')

prepare() {
    cd $pkgname
    sed -i "s/os.name is/os.name ==/g" setup.py # fix warning
}

build() {
    cd $pkgname
    python setup.py build
}

package() {
    cd $pkgname
    python setup.py install --root="$pkgdir/" --optimize=1
}
