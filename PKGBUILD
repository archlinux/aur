# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>

pkgname=gcdemu
pkgver=3.2.2
pkgrel=1
pkgdesc="GNOME panel applet controlling cdemu-daemon"
arch=('any')
url="http://cdemu.sourceforge.net/"
license=('GPL2')
depends=('cdemu-daemon' 'python-gobject' 'gtk3')
optdepends=('libnotify' 'libappindicator-gtk3')
makedepends=('cmake' 'intltool')
source=("https://downloads.sourceforge.net/cdemu/$pkgname-$pkgver.tar.bz2")
sha256sums=('760018d73685dff0d146d9639647f65b27e56899731bd63f82622da0208f5fe3')

build() {
    mkdir "$srcdir/build"
    cd "$srcdir/build"
    cmake -DPOST_INSTALL_HOOKS=off -DCMAKE_INSTALL_PREFIX=/usr ../"$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
}
