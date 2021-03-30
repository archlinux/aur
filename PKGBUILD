# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=mozillavpn
pkgver=2.1.0
pkgrel=1
epoch=
pkgdesc="A fast, secure and easy to use VPN. Built by the makers of Firefox."
arch=('i686' 'x86_64')
url="https://vpn.mozilla.org/"
license=('GPL')
groups=()
depends=('polkit'
         'qt5-charts'
         'qt5-declarative'
         'qt5-graphicaleffects'
         'qt5-imageformats'
         'qt5-networkauth'
         'qt5-quickcontrols2'
         'qt5-svg'
         'hicolor-icon-theme'
         'wireguard-tools'
         'WIREGUARD-MODULE')
makedepends=('qt5-tools')
checkdepends=()
optdepends=()
provides=()
conflicts=('mozilla-vpn-client')
replaces=('mozilla-vpn-client')
backup=()
options=()
install=
changelog=
source=("https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/$pkgname/$pkgver-focal1/${pkgname}_${pkgver}.orig.tar.gz")
noextract=()
sha256sums=('290eace9a4f76ed79062015bade39db56584a5c1868625df24dfb196d6c71a22')
validpgpkeys=()

build() {
        qmake PREFIX=/usr CONFIG+=production CONFIG-=debug CONFIG+=release CONFIG-=debug_and_release
	make
}

package() {
	make INSTALL_ROOT="$pkgdir" install
}
