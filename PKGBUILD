# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: Vincent Demeester <vincent@sbr.pm>
# Contributor: Pat Brisbin <pbrisbin@gmail.com>
pkgname=rcm
pkgver=1.2.3
pkgrel=1
pkgdesc="rc file (dotfiles) management"
arch=('any')
url="https://github.com/thoughtbot/$pkgname"
license=('BSD')
makedepends=('ruby-mustache')
source=("https://thoughtbot.github.io/$pkgname/dist/$pkgname-$pkgver.tar.gz")
md5sums=('7ac43eef04cacb91a00f902852369aaf')

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
