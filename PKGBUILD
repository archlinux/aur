# Maintainer: Amogh Lele amolele@gmail.com
pkgname=katamari
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A projects page generator for GitHub users and organizations"
arch=('x86_64')
url="https://github.com/GDGVIT/katamari"
license=('GPL')
groups=()
depends=('hugo')
makedepends=('go')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('https://codeload.github.com/GDGVIT/katamari/tar.gz/v1.0.0')
sha256sums=('b46fae19022176551643d431ba16d47745cc833b776e327028141bf8e0108c9f')
noextract=()
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
    go build .
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/$pkgname/license
    install $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin
    install $srcdir/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/$pkgname/license/
}
