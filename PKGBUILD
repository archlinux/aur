# 
pkgname=sdn
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple directory navigator"
arch=('x86_64')
url="https://git.janouch.name/p/sdn/"
license=('custom:0BSD')
depends=('ncurses' 'acl')
makedepends=()

source=('CMakeLists.txt' 'LICENSE' 'Makefile' 'sdn.cpp' 'README.adoc')
sha256sums=('b1a4e46c791439e123ab4500e07752c1769f1b29747382aa10fce868761a76cc'
            '6fa6aa209c970a527f74a0185c73e95a3a8321dd64bc839510d2b22801f7f234'
            '7b4818712c89c27b4b393d607afee0be9a12b1ba9606686667c99cee673c81c8'
            '0cf4ad2e812251ac033dbbd451ef8f986d930510d3e852bd785ad8c43a6ff76e'
            '9324c251cbabccb80a6923957a4add997c54581edb0865f3532284ac422a13d6')

build() {
    # cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    # make install
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 README.adoc "$pkgdir"/usr/share/doc/$pkgname/README.adoc
}

