# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Kuklin István <kuklinistvan@zoho.com>
# Contributor: Aria Moradi <aria.moradi007 at gmail dot com>


pkgname=anki-official-binary-bundle
pkgver=2.1.66
_pkgname="anki-$pkgver-linux-qt6"
pkgrel=1
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
sha256sums=('3f53c42b3d2f6e53f188bae2df842b3f4faa3ac96d26cbcf2f62559988f5c058'
            '991297cb02434d753f55980205a22971ed98655b0f62f0104ae4692155355d8c')

prepare() {
	cd "$srcdir/$_pkgname"
	patch install.sh ../install_sh.patch
}

package() {
	cd "$_pkgname"
	PREFIX="$pkgdir/usr/" ./install.sh
}
