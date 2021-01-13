# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=mozillavpn
pkgver=2.0.1
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
source=("https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/$pkgname/$pkgver-focal2/${pkgname}_${pkgver}.orig.tar.gz")
noextract=()
sha256sums=('c2d60f1a1d28923a2f4f0d5231abc9c72505dabb816364140146318bfc212b21')
validpgpkeys=()

build() {
        qmake PREFIX=/usr CONFIG+=production CONFIG-=debug CONFIG+=release CONFIG-=debug_and_release
	make
}

package() {
	make INSTALL_ROOT="$pkgdir" install
}
