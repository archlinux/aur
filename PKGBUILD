# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Jesse R. Adams <jesse -at- techno -dash- geeks -dot- org>
pkgname=tudu
pkgver=0.10.4
pkgrel=1
pkgdesc="ncurses-based hierarchical todo list manager with vim-like keybindings"
arch=(i686 x86_64)
url="https://code.meskio.net/tudu/"
license=('GPL')
depends=('ncurses')
source=(https://code.meskio.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('5eebc5299330037be429355321aa4ab53650f4ff8575b349d623466492c55993')

build() {
    cd "${pkgname}-${pkgver}"

    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${pkgname}-${pkgver}"

    make DESTDIR=${pkgdir} install
    install -vDm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
