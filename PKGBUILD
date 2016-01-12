# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: Vincent Demeester <vincent@sbr.pm>
# Contributor: Pat Brisbin <pbrisbin@gmail.com>
# Contributor: Max Falk <gmdfalk@gmail.com>
pkgname=rcm
pkgver=1.3.0
pkgrel=1
pkgdesc="rc file (dotfiles) management"
arch=('any')
url="https://github.com/thoughtbot/$pkgname"
license=('BSD')
makedepends=('make ruby-mustache')
source=("https://thoughtbot.github.io/$pkgname/dist/$pkgname-$pkgver.tar.gz")
conflicts=(${pkgname}-git)
provides=(${pkgname})

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
sha256sums=('ddcf638b367b0361d8e063c29fd573dbe1712d1b83e8d5b3a868e4aa45ffc847')
