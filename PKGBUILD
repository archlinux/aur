# Maintainer: Kyle Terrien <kyleterrien at gmail dot com>
# Copied from wmbattery
pkgname=wmload
pkgver=0.9.6
pkgrel=1
pkgdesc="Dockable CPU indicator for Window Maker"
arch=(i686 x86_64)
url="http://windowmaker.org/dockapps/?name=wmload"
license=('GPL')
depends=(libxpm)
source=("$pkgname-$pkgver.tar.gz::http://windowmaker.org/dockapps/?download=$pkgname-$pkgver.tar.gz")
sha256sums=('af4a1c63ea22505b83d0a5ad3b589548208008e1781423b38f2a4d5df962ad91')

build() {
    cd "$srcdir/dockapps-"*
    make
}

package() {
    cd "$srcdir/dockapps-"*
    make PREFIX=/usr DESTDIR="$pkgdir/" install
    install -Dm644 README ${pkgdir}/usr/share/doc/wmload/README
}
