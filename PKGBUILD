# Contributor: Hugo Ideler <hugo at hugoideler dot com>
pkgname=jaxx
pkgver=1.2.33
pkgrel=1
epoch=
pkgdesc="Multi-chain cryptocurrency wallet"
arch=('x86_64')
# ^ not tested on other platforms
url="https://jaxx.io/"
license=('unknown')
groups=()
depends=()
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
source=("https://jaxx.io/files/$pkgver/Jaxx-v${pkgver}_linux-x64.tar.gz" "jaxx.desktop")
noextract=()
sha256sums=('ebe3183d1151282a22521be614a7e9cc37303259bb9c31c6d2b594784935320c'
            '4e4323a365c878378b5ed019a4a78e0cd94148abbc649e0972414ef38e9f7139')
validpgpkeys=()

prepare() {
        true
}

build() {
        true
}

check() {
        true
}

package() {
        mkdir -p $pkgdir/opt/$pkgname
        cp -a Jaxx-v${pkgver}_linux-x64/jaxx-assets/* $pkgdir/opt/$pkgname

        mkdir -p $pkgdir/usr/bin
        ln -s ../../opt/$pkgname/Jaxx $pkgdir/usr/bin/$pkgname

        install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim: et
