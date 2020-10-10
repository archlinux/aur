# Maintainer: Leandro Guedes <leandroguedes@protonmail.com>

pkgname=f33-backgrounds
pkgver=33.0.7
pkgrel=1
_relnum=33
pkgdesc="Fedora $_relnum backgrounds"
arch=('any')
url="https://fedoraproject.org/wiki/F${_relnum}_Artwork"
license=('custom')
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/f$_relnum-backgrounds-$pkgver-$pkgrel.fc34.src.rpm")
sha256sums=('dcaa804ed55c25fc375372e1036f1720c3c8113033fb2bf452fdcd3f690118da')

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
