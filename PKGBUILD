# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.com>
pkgname=lightdm-mini-greeter
pkgver=0.1.1
pkgrel=2
pkgdesc="A Minimal, Configurable, Single-User GTK3 LightDM Greeter"
arch=('i686' 'x86_64')
url="https://github.com/prikhi/lightdm-mini-greeter"
license=('GPL3')
depends=('lightdm' 'gtk3')
backup=('etc/lightdm/lightdm-mini-greeter.conf')
source=("https://github.com/prikhi/lightdm-mini-greeter/archive/$pkgver.zip")
sha256sums=('42703c8981c123b06b25a2891ed534c14805717f92a39e143d721719f9404a2f')

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
