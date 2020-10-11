# Maintainer: Leandro Guedes <leandroguedes@protonmail.com>

pkgname=f32-backgrounds
pkgver=32.2.2
pkgrel=2
_relnum=32
pkgdesc="Fedora $_relnum backgrounds"
arch=('any')
url="https://fedoraproject.org/wiki/F${_relnum}_Artwork"
license=('custom')
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/f$_relnum-backgrounds-$pkgver-$pkgrel.fc33.src.rpm")
sha256sums=('c78aa5ed090b9aae9b4b4f21f10e83c6611bd0a64efbefb83686768dc89f8143')

prepare() {
    tar -xvJf ./${pkgname}-${pkgver}.tar.xz
    rm -r ./${pkgname}-${pkgver}.tar.xz
    rm -r ./${pkgname}.spec
}

build() {
    cd ./${pkgname}
    make
}

package() {
    cd ./${pkgname}
    make install DESTDIR="$pkgdir"
    install -Dm 644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

#vim: syntax=sh
