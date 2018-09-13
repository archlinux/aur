# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: Vincent Demeester <vincent@sbr.pm>
# Contributor: Pat Brisbin <pbrisbin@gmail.com>
# Contributor: Max Falk <gmdfalk@gmail.com>
# Contributor: Mikhail f. Shiryaev <mr<dot>felixoid<at>gmail<dot>com>
pkgname=rcm
pkgver=1.3.3
pkgrel=1
pkgdesc="rc file (dotfiles) management"
arch=('any')
url="https://github.com/thoughtbot/$pkgname"
license=('BSD')
source=("https://thoughtbot.github.io/$pkgname/dist/$pkgname-$pkgver.tar.gz")
conflicts=(${pkgname}-git)
provides=(${pkgname})
sha256sums=('935524456f2291afa36ef815e68f1ab4a37a4ed6f0f144b7de7fb270733e13af')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure \
        --disable-silent-rules \
        --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
