# Maintainer: Kuklin István <kuklinistvan@zoho.com>
# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>


pkgname=anki-official-binary-bundle
pkgver=2.1.62
_pkgname="anki-$pkgver-linux-qt6"
pkgrel=2
epoch=
pkgdesc="The official binary shipped with the tested versions of the dependent libraries."
arch=('x86_64')
url="https://github.com/ankitects/anki"
license=('AGPL')
groups=()
depends=('libxkbcommon-x11')
makedepends=()
optdepends=('mpv')
provides=('anki')
conflicts=('anki' 'anki-bin' 'anki-git')
replaces=()
options=()
install=$pkgname.install
source=("https://github.com/ankitects/anki/releases/download/${pkgver}/${_pkgname}.tar.zst"
        "install_sh.patch")
sha256sums=('becb91fa90ea8cf19e8e5c6b0cf0b12959ef4e29510c61a13030ca490855c554'
            '991297cb02434d753f55980205a22971ed98655b0f62f0104ae4692155355d8c')

prepare() {
	cd "$srcdir/$_pkgname"
	patch install.sh ../install_sh.patch
}

package() {
	cd "$_pkgname"
	PREFIX="$pkgdir/usr/" ./install.sh
}
