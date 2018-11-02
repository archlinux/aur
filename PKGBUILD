# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.com>
pkgname=lightdm-mini-greeter
pkgver=0.3.4
pkgrel=1
pkgdesc="A Minimal, Configurable, Single-User GTK3 LightDM Greeter"
arch=('i686' 'x86_64')
url="https://github.com/prikhi/lightdm-mini-greeter"
license=('GPL3')
depends=('lightdm' 'gtk3')
backup=('etc/lightdm/lightdm-mini-greeter.conf')
source=("https://github.com/prikhi/lightdm-mini-greeter/archive/$pkgver.zip"
        "lightdm-mini-greeter.install")
sha256sums=('4d0e135272afc2e88507b905c91a073a11de1059cd6cfd6f7d4bb706efeb1070'
            '5fb6e83300952950cf8936d11d20b85e9622a88f84e18c43fda2d41ebcedf857')
install="lightdm-mini-greeter.install"

build() {
    cd "$pkgname-$pkgver"
    ./autogen.sh
    ./configure --datadir=/usr/share --bindir=/usr/bin --sysconfdir=/etc
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
