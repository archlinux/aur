# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=f34-backgrounds
pkgver=34.0.1
pkgrel=1
_relnum=34
pkgdesc="Fedora $_relnum backgrounds"
arch=('any')
url="https://fedoraproject.org/wiki/F${_relnum}_Artwork"
license=('custom')
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/f$_relnum-backgrounds-$pkgver-$pkgrel.fc35.src.rpm")
sha256sums=('32fb14652e207a3812cceeb8edb16531e4665491efae0eed560e23bdf3bfb0fe')

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
