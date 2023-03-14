# Maintainer: Kuklin István <kuklinistvan@zoho.com>
# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>


pkgname=anki-official-binary-bundle
pkgver=2.1.58
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
source=("https://github.com/ankitects/anki/releases/download/${pkgver}/${topdirname}.tar.zst"
        "install_sh.patch")
sha256sums=('f6b94d4a16dda2c09aeb47f8265842d78765de3d83c6a16bdc680e38c59d5c56'
            '991297cb02434d753f55980205a22971ed98655b0f62f0104ae4692155355d8c')

topdirname="anki-$pkgver-linux-qt6"
prepare() {
	cd "$srcdir/$topdirname"
	patch install.sh ../install_sh.patch
}

package() {
	cd "$topdirname"
	PREFIX="$pkgdir/usr/" ./install.sh
}
