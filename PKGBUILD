# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Gno <noreply@gno.com>
pkgname=caelestia-gif
pkgver=1.0.1
pkgrel=5
epoch=
pkgdesc="A script to manage and change GIFs in Caelestia shell"
arch=('x86_64')
url="https://gitlab.com/gnoooo/caelestia-gif"
license=('GPL-3.0-or-later')
groups=()
depends=('imagemagick' 'cjson' 'xdg-utils' 'ncurses' 'bash')
makedepends=('git' 'base-devel')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=caelestia-gif.install
changelog=
#source=("https://gitlab.com/gnoooo/caelestia-gif/-/archive/master/caelestia-gif-master.tar.gz?ref_type=heads")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
noextract=()
sha256sums=('6937a818a314a824d9137d2f540241cc1021a40103de4d8b593703962237bc7a')
validpgpkeys=()

prepare() {
    cd "$srcdir/$pkgname-v$pkgver"
}

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    make
}

check() {
    return 0
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    #fakeroot ./install_bin
    make DESTDIR="$pkgdir" install
}
