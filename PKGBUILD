# Maintainer: Alexander Lehmann <afwlehmann@googlemail.com>
pkgname=pasmo
pkgver=0.5.4.beta2
pkgrel=1
epoch=
pkgdesc="Portable Z80 cross assembler"
arch=('any')
url="http://pasmo.speccy.org/"
license=('GPLv2')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://pasmo.speccy.org/bin/$pkgname-$pkgver.tgz")
noextract=()
md5sums=(c85b0b7935ea174f9a57821019f464fa)
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
        AUTHORS \
        COPYING \
        ChangeLog \
        INSTALL \
        NEWS \
        README \
        pasmodoc.html
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" *.asm
}
