# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.com>
pkgname=lightdm-mini-greeter
pkgver=0.1.0
pkgrel=1
pkgdesc="A Minimal, Configurable, Single-User GTK3 LightDM Greeter"
arch=('i686' 'x86_64')
url="https://github.com/prikhi/lightdm-mini-greeter"
license=('GPL3')
groups=()
depends=('lightdm' 'gtk3')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/prikhi/lightdm-mini-greeter/archive/$pkgver.zip")
noextract=()
sha256sums=('8c399f490023aa128ace35a22f6d200895db2fb3c75462c1a8db4788d4221e2c')
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
    ./autogen.sh
    ./configure --datadir=/usr/share --bindir=/bin --sysconfdir=/etc
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
