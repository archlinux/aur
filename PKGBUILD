# Maintainer: Leandro Guedes <leandroguedes@protonmail.com>

pkgname=f32-backgrounds
pkgver=32.2.2
pkgrel=4
_relnum=32
pkgdesc="Fedora $_relnum backgrounds"
arch=('any')
url="https://fedoraproject.org/wiki/F${_relnum}_Artwork"
license=('custom')
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/f$_relnum-backgrounds-$pkgver-$pkgrel.fc35.src.rpm")
sha256sums=('81c623efc60679b262b5ee434b964d0a79f19e105d620b423a96c6ba04d80cae')

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
