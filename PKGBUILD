# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Gno <noreply@gno.com>
pkgname=caelestia-gif
pkgver=1.0.2
pkgrel=2
epoch=
pkgdesc="A script to manage and change GIFs in Caelestia shell"
arch=('x86_64')
url="https://gitlab.com/gnoooo/caelestia-gif"
license=('GPL-3.0-or-later')
groups=()
depends=('imagemagick' 'cjson' 'xdg-utils' 'ncurses' 'bash')
makedepends=('git' 'base-devel' 'gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=caelestia-gif.install
changelog=
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
    return 0
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
    install -Dm755 ./bin/caelestia-gif "$pkgdir/usr/bin/caelestia-gif"
    install -Dm644 ./README.md "$pkgdir/usr/share/doc/caelestia-gif/README.md"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/caelestia-gif/LICENSE"
}

