# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.com>
pkgname=lightdm-mini-greeter
pkgver=0.5.0
pkgrel=1
pkgdesc="A Minimal, Configurable, Single-User GTK3 LightDM Greeter"
arch=('i686' 'x86_64')
url="https://github.com/prikhi/lightdm-mini-greeter"
license=('GPL3')
depends=('lightdm' 'gtk3')
backup=('etc/lightdm/lightdm-mini-greeter.conf')
source=("https://github.com/prikhi/lightdm-mini-greeter/archive/$pkgver.zip"
        "lightdm-mini-greeter.install")
sha256sums=('a5b9310c35ce4f37737b1022f983c4cb7eed1645b7744a7292f1b0de24fd4d23'
            'b1d88f4ef9b740cba25cdda81bac8fe4fc3110b404e34dc89c8e47d81c8d75a7')
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
