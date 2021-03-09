# Maintainer: DevHyperCoder <arduinoleo88 at gmail dot com>

pkgname=alpc-git 
pkgver=1.0.0
pkgrel=1
pkgdesc="Aviation Language Phonetic Converter"
arch=('x86_64')
url="https://github.com/DevHyperCoder/alpc"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'rust' 'cargo' ) 
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
source=("git+https://github.com/DevHyperCoder/alpc.git")
noextract=()
md5sums=('SKIP')

build() {
	cd alpc
    cargo build --release
}


package() {
	cd alpc
    install -Dm755 "target/release/alpc" \
        -t "$pkgdir/usr/bin/"
}
