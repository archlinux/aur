# Maintainer: Ainola
# Contributor: Vinícius dos Santos Oliveira

pkgname=gnomato
pkgver=1.1.0
pkgrel=1
pkgdesc="A timer for Pomodoro Technique"
arch=(i686 x86_64)
url="https://github.com/diegorubin/gnomato"
license=('GPL3')
depends=('gtkmm3' 'libnotify' 'boost-libs' 'python2')
makedepends=('intltool' 'gettext' 'boost')
source=("https://github.com/diegorubin/gnomato/archive/$pkgver.tar.gz")
sha256sums=('450cbddbc36709727774a96cfa319cf70ddce88e442eb75da2ec0b837ce8e44b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    autoreconf -vi
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
