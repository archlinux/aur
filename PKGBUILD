# Maintainer: Michal Babik <michalb1981@o2.pl>

pkgname=wallchanger
pkgver=1.4.3
pkgrel=1
pkgdesc="Automatic wallpaper changer"
arch=('i686' 'x86_64')
url="https://www.nongnu.org/wallchanger/"
license=('GPL3')
depends=('json-c>=0.12.1' 'gtk3>=3.22.0')
source=("https://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('25200c347114c6456bfa774eb0b0c6e0')
build() {
        cd "$srcdir/$pkgname-$pkgver"
        ./configure --prefix=/usr
        make
}
package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}

