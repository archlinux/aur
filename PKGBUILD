# Maintainer: Leandro Guedes <leandroguedes@protonmail.com>

pkgname=f33-backgrounds
pkgver=33.0.8
pkgrel=3
_relnum=33
pkgdesc="Fedora $_relnum backgrounds"
arch=('any')
url="https://fedoraproject.org/wiki/F${_relnum}_Artwork"
license=('custom')
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/f$_relnum-backgrounds-$pkgver-$pkgrel.fc35.src.rpm")
sha256sums=('d107d41a5ccbc15cd7d15a5d9768c5f2643ec303f09c252e5a25a6e2e4d3e7a6')

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
